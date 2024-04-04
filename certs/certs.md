# Create X.509 certificates

All passwords: `changeit`

## RootCA

    openssl req -x509 -sha256 -days 3650 -newkey rsa:4096 -keyout rootCA.key -out rootCA.crt

## Host certificate

    openssl req -new -newkey rsa:4096 -keyout localhost.key -out localhost.csr -nodes

    openssl req -new -newkey rsa:4096 -keyout ldap.key -out ldap.csr -nodes

### Sign host csr with rootCA:

    openssl x509 -req -CA rootCA.crt -CAkey rootCA.key -in localhost.csr -out localhost.crt -days 3650 -CAcreateserial -extfile localhost.ext

    openssl x509 -req -CA rootCA.crt -CAkey rootCA.key -in ldap.csr -out ldap.crt -days 3650 -CAcreateserial
