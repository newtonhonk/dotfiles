#!/bin/bash
if rfkill list bluetooth | grep -q 'yes$' ; then 
    rfkill unblock bluetooth
else
    rfkill block bluetooth
fi

