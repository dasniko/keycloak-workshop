<#macro emailLayout>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
body {
  background-color: #e95420;
  padding: 40px;
  text-align: center;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
}
main {
  background-color: white;
  padding: 40px;
  border-radius: 8px;
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}
</style>
</head>
<body>
  <main>
  <#nested>
  </main>
</body>
</html>
</#macro>
