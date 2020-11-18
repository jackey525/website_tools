#!/bin/bash
TARGET="google.com";


expirationdate=$(date -d "$(: | openssl s_client -connect $TARGET:443 -servername $TARGET 2>/dev/null \
                              | openssl x509 -text \
                              | grep 'Not After' \
                              |awk '{print $4,$5,$7}')" '+%s');

ssldate=$(date -d @$expirationdate '+%Y-%m-%d')

echo $ssldate
