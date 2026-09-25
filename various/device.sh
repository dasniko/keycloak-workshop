#!/bin/bash

CLIENT_ID=device-authz-code
CLIENT_SECRET=JOFrDVtIpU2cwyK8AnGOoR2gAnqUIEkB

read -n 1 -rep $"You are not authenticated, press any key to start authentication..."

RESP=$(curl -s --request POST \
  --url http://localhost:8080/realms/demo/protocol/openid-connect/auth/device \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data client_id=${CLIENT_ID} \
  --data client_secret=${CLIENT_SECRET} \
  --data scope=openid+profile+email)

DEVICE_RESP=$(echo ${RESP} | jq .)
echo "Device Response:\n${DEVICE_RESP}!"

DEVICE_CODE=$(echo ${RESP} | jq -r ".device_code")
INTERVAL=$(echo ${RESP} | jq -r ".interval")
URL=$(echo ${RESP} | jq -r ".verification_uri_complete")
echo "You can authenticate using this URI: ${URL}"
read -n 1 -rep $'Press any key to open browser...'
open ${URL}

DO_CALLBACK=true
CB_RESP=""
while ${DO_CALLBACK}
do
    CB_RESP=$(curl -s --request POST \
        --url http://localhost:8080/realms/demo/protocol/openid-connect/token \
        --header 'Content-Type: application/x-www-form-urlencoded' \
        --data grant_type=urn:ietf:params:oauth:grant-type:device_code \
        --data client_id=${CLIENT_ID} \
        --data client_secret=${CLIENT_SECRET} \
        --data device_code=${DEVICE_CODE})
    TOKEN=$(echo ${CB_RESP} | jq -r ".access_token")
    if [[ "$TOKEN" == "null" ]]
    then
        echo ${CB_RESP} | jq -r ".error_description"
    else
        DO_CALLBACK=false
    fi
    sleep ${INTERVAL}
done

JWT=$(echo ${CB_RESP} | jq -r ".access_token")
echo "access_token: ${JWT}"
RESULT=$(jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$JWT")
echo ${RESULT} | jq .

JWT=$(echo ${CB_RESP} | jq -r ".id_token")
echo "id_token: ${JWT}"
RESULT=$(jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$JWT")
echo ${RESULT} | jq .
NAME=$(echo ${RESULT} | jq -r ".name")
echo "Hello ${NAME}!"
