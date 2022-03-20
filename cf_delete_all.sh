#!/bin/bash
EMAIL=""
API_KEY=""
DOMAIN=""

ZONE_ID=$(curl --location --request GET "https://api.cloudflare.com/client/v4/zones?name=$DOMAIN" \
--header "X-Auth-Email: $EMAIL" \
--header "X-Auth-Key: $API_KEY" | grep -Po '"id":.*?",' | sed -e 's/"id":"//' -e 's/",//' | head -1)

ALL_RECORD_IDS=$(curl --location --request GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
--header "X-Auth-Email: $EMAIL" \
--header "X-Auth-Key: $API_KEY" | grep -Po '"id":.*?",' | sed -e 's/"id":"//' -e 's/",//')

for RECORD_ID in $ALL_RECORD_IDS
do
    curl --location --request DELETE "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID" \
    --header "X-Auth-Email: $EMAIL" \
    --header "X-Auth-Key: $API_KEY"
done
