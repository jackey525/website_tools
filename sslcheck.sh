#!/bin/bash
    gracedays=30
    date1=`echo |openssl x509 -enddate -noout -in /etc/ssl/certs/server.cer | sed -e 's#notAfter=##'`
    ssldate=$(date -d "${date1}" +%s)
    nowdate=`date '+%s'`
    diff="$((${ssldate}-${nowdate}))"
    #echo $diff
    if test "${diff}" -lt "$((${gracedays}*24*3600))";
    then
        if test "${diff}" -lt "0";
        then
            msg="The certificate  has already expired."
            echo $msg
            curl -G --data-urlencode "chat_id=-385404270" --data-urlencode "text=The certificate  has already expired" https://api.telegram.org/botxxx__your token__xxxx/sendMessage
        else
            msg="The certificate for cdn-news.org  will expire in $((${diff}/3600/24)) days."
            echo $msg
            curl -G --data-urlencode "chat_id=-385404270" --data-urlencode "text=The certificate will expire in $((${diff}/3600/24)) days." https://api.telegram.org/botxxx__your token__xxxx/sendMessage
        fi
    fi

    
