#!/bin/bash
telegram=(-474654476)

if ! pidof apache2 > /dev/null
then
    # web server down, restart the server
    echo "Server down"
    /etc/init.d/apache2 restart > /dev/null
    sleep 10

    #checking if apache restarted or not
    if pidof apache2 > /dev/null
    then
        for i in "${telegram[@]}"
        do
        curl -s -X POST https://api.telegram.org/botxxxxxx:yyyyyyyyyyyyyyyyyyyyyyyyyy/sendMessage -d chat_id="$i" -d text="`echo -e '\U0001F525'` Apache stoped on Molib Stage. Automatically restarted succesfully."
        done
    else
        for i in "${telegram[@]}"
        do
        curl -s -X POST https://api.telegram.org/botxxxxxx:yyyyyyyyyyyyyyyyyyyyyyyyyy/sendMessage -d chat_id="$i" -d text="`echo -e '\U0001F525'` Apache stoped on Molib Stage. Automatically restart failed. Please check manually."
        done
    fi
fi
