@echo off
rem update-images.bat - pull all container images used in this workshop.
rem
rem Windows counterpart of update-images.sh. The images are discovered from
rem the repository itself (compose files, the Keycloak Dockerfile and the
rem "docker run" helper scripts), so the list stays correct when versions
rem change. Locally built images (e.g. keycloak-workshop) are skipped, they
rem are created by "docker compose build".

setlocal enabledelayedexpansion

set "ROOT=%~dp0.."
set "LIST_ONLY="
set "IMAGES="
set "SEEN=;"
set "COUNT=0"

rem Prefer an explicitly requested CLI, else docker, else podman
if not defined DOCKER (
    where docker >nul 2>&1 && set "DOCKER=docker"
)
if not defined DOCKER (
    where podman >nul 2>&1 && set "DOCKER=podman"
)
if not defined DOCKER set "DOCKER=docker"

:parse_args
if "%~1"=="" goto args_done
if /i "%~1"=="-l" goto opt_list
if /i "%~1"=="--list" goto opt_list
if /i "%~1"=="-h" goto opt_help
if /i "%~1"=="--help" goto opt_help
if /i "%~1"=="/?" goto opt_help
echo Unknown option: %~1 1>&2
call :usage 1>&2
exit /b 2

:opt_list
set "LIST_ONLY=1"
shift
goto parse_args

:opt_help
call :usage
exit /b 0

:args_done

rem --- compose files: "image: <name>" ------------------------------------
for %%f in ("%ROOT%\*.yml") do (
    for /f "tokens=2" %%i in ('findstr /b /r /c:" *image:" "%%f" 2^>nul') do call :add_image "%%i"
)

rem --- Keycloak base image from the Dockerfile ARG default ---------------
for /f "tokens=2 delims==" %%i in ('findstr /b /c:"ARG KEYCLOAK_BASE_IMAGE=" "%ROOT%\Dockerfile" 2^>nul') do call :add_image "%%i"

rem --- images used in "docker run" helper scripts ------------------------
for %%f in ("%ROOT%\*.sh" "%ROOT%\*.bat" "%ROOT%\benchmark\*.sh" "%ROOT%\benchmark\*.bat") do (
    for /f "usebackq delims=" %%l in (`findstr /r /c:"docker run " "%%f" 2^>nul`) do (
        rem keep the line in a variable, so that "call" cannot re-expand a %% in it
        set "line=%%l"
        call :scan_line
    )
)

if %COUNT% EQU 0 (
    echo No images found in "%ROOT%" - has the repository layout changed? 1>&2
    exit /b 1
)

echo ==^> Images used in this workshop (%COUNT%):
for %%i in (!IMAGES!) do echo   %%i

if defined LIST_ONLY exit /b 0

where "%DOCKER%" >nul 2>&1
if errorlevel 1 (
    echo Error: '%DOCKER%' not found in PATH. Is Docker installed? 1>&2
    exit /b 1
)

"%DOCKER%" info >nul 2>&1
if errorlevel 1 (
    echo Error: cannot talk to the container daemon. 1>&2
    echo Hint: is Docker Desktop running? 1>&2
    exit /b 1
)

echo(
echo ==^> Pulling with '%DOCKER%'...
set "FAILED="
set "N=0"
for %%i in (!IMAGES!) do (
    set /a N+=1
    echo(
    echo --- [!N!/%COUNT%] %%i
    "%DOCKER%" pull %%i || set "FAILED=!FAILED! %%i"
)

echo(
if not defined FAILED (
    echo ==^> Done, all %COUNT% images are up to date.
    exit /b 0
)
echo ==^> Done, but the following image^(s^) failed to pull: 1>&2
for %%i in (!FAILED!) do echo   %%i 1>&2
exit /b 1

rem ========================================================================

:scan_line
rem skip commented-out lines ("#" in sh, "rem" or "::" in bat)
if "!line:~0,1!"=="#" goto :eof
if "!line:~0,2!"=="::" goto :eof
if /i "!line:~0,4!"=="rem " goto :eof
for %%t in (!line!) do (
    set "tok=%%t"
    echo(!tok!| findstr /i /b /e /r /c:"[a-z0-9][a-z0-9.-]*/[a-z0-9./_-]*:[a-z0-9._-]*" >nul && call :add_image "!tok!"
)
goto :eof

:add_image
set "img=%~1"
if not defined img goto :eof
rem skip locally built images (no registry/tag, e.g. keycloak-workshop)
echo(!img!| findstr /r /c:"[/:]" >nul || goto :eof
if "!SEEN:;%~1;=!"=="!SEEN!" (
    set "IMAGES=!IMAGES! !img!"
    set "SEEN=!SEEN!!img!;"
    set /a COUNT+=1
)
goto :eof

:usage
echo update-images.bat - pull all container images used in this workshop.
echo(
echo Usage:
echo   various\update-images.bat [--list] [--help]
echo(
echo   -l, --list   only list the images, do not pull them
echo   -h, --help   show this help
echo(
echo Environment:
echo   DOCKER   container CLI to use (default: docker, or podman if docker is not installed)
goto :eof
