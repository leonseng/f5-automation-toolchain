# Check installation

```
curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding/info | jq .
```

# Onboard

```
DATA=$(jq \
  --arg hostname "$HOSTNAME" \
  --arg key "$LICENSE_KEY" \
  --arg int_ip "$INTERNAL_IP" \
  --arg ext_ip "$EXTERNAL_IP" \
  --arg default_gw "$DEFAULT_GATEWAY" \
  '.Common.mySystem.hostname |= $hostname | .Common.myLicense.regKey |= $key | .Common."internal-self".address |= $int_ip | .Common."external-self".address |= $ext_ip | .Common.default.gw |= $default_gw |' \
  requests/do-v1.json)
curl -X POST -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/declarative-onboarding
```

# Check status

```
while true; do curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding | jq .result.status; sleep 1; done
```

# Update

```
DATA=$(jq --arg key "$LICENSE_KEY" '.Common.myLicense.regKey |= $key' requests/do-v2.json)
curl -X POST -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/declarative-onboarding
```

# Clean Up

```
DATA=$(jq --arg key "$LICENSE_KEY" '.Common.myLicense.regKey |= $key' requests/do-v1.json)
curl -X POST -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/declarative-onboarding
```