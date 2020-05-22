#!/bin/bash

TODAY=$(date +"%Y%m%d")
vnstati -s -i ens32 -o /home/jason/${TODAY}summary.png
sleep 10
curl -s -X POST "https://api.telegram.org/botyyyyyyyyyyyyyyyyyyyyyyyy/sendPhoto" -F chat_id=-474654476 -F photo="@//home/jason/${TODAY}summary.png"
~
