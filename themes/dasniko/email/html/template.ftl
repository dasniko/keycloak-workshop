<#macro emailLayout>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
body {
  background-color: #1f9bcf;
  padding: 40px;
  text-align: center;
  font-family: "Nunito Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
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
