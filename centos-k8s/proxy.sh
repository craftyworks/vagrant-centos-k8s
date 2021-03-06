#!/usr/bin/env bash

cat <<EOF > /tmp/SDS.crt
-----BEGIN CERTIFICATE-----
MIIDUjCCArugAwIBAgIJAKzaAATW//aZMA0GCSqGSIb3DQEBBQUAMHoxCzAJBgNV
BAYTAktSMQ4wDAYDVQQIEwVTZW91bDETMBEGA1UEBxMKR2FuZ21hbi1ndTEUMBIG
A1UEChMLU0FNU1VORyBTRFMxDDAKBgNVBAMTA1NEUzEiMCAGCSqGSIb3DQEJARYT
aW5mb3NlY0BzYW1zdW5nLmNvbTAeFw0xMjExMDkwNzU5MDVaFw0zNzExMDMwNzU5
MDVaMHoxCzAJBgNVBAYTAktSMQ4wDAYDVQQIEwVTZW91bDETMBEGA1UEBxMKR2Fu
Z21hbi1ndTEUMBIGA1UEChMLU0FNU1VORyBTRFMxDDAKBgNVBAMTA1NEUzEiMCAG
CSqGSIb3DQEJARYTaW5mb3NlY0BzYW1zdW5nLmNvbTCBnzANBgkqhkiG9w0BAQEF
AAOBjQAwgYkCgYEA0tOlHychBr2wXOTNgV59JyetRMVGihI09+ABEsqz/4KLAuJA
qxIM+MZkOPPjemM/otGD1tnz/Fw1s/PHHrC5NAWrfawSQd/DvWuKFWaZMZL7IsZ/
Wmg5qdLITLeXeZv79uiDsUSCK1HlddZRUebxHX2dveDgQ4FnpEWgmK4D1gUCAwEA
AaOB3zCB3DAdBgNVHQ4EFgQUnMyf8r+sQIWkIFYiXMhTmXNAw+cwgawGA1UdIwSB
pDCBoYAUnMyf8r+sQIWkIFYiXMhTmXNAw+ehfqR8MHoxCzAJBgNVBAYTAktSMQ4w
DAYDVQQIEwVTZW91bDETMBEGA1UEBxMKR2FuZ21hbi1ndTEUMBIGA1UEChMLU0FN
U1VORyBTRFMxDDAKBgNVBAMTA1NEUzEiMCAGCSqGSIb3DQEJARYTaW5mb3NlY0Bz
YW1zdW5nLmNvbYIJAKzaAATW//aZMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEF
BQADgYEAbbBmxjw88hM5FSFhcM+qoXlzignpECU0dO3bjdf2qkuQfAGDkXRdfNv9
1wL9Qi683S6YshowEKngQoK8UTVwtGylWt5dGNAyc8t+S7QSAwDPgJp2L0wEGwCb
GmbeNpJ3res+KW5xIIZt1YMi73sTlRwtKl5Lksa1kskUKVUfp80=
-----END CERTIFICATE-----
EOF

# install proxy cert
cp /tmp/SDS.crt /etc/pki/ca-trust/source/anchors/
update-ca-trust extract

# git
echo 'export GIT_SSL_NO_VERIFY=true' >> /etc/profile

