#!/bin/bash
server="31.37.54.74"
port="-p 4044"
echo "specify user:"
read user
ssh  $user@$server $port
