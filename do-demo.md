# Check installation

```
curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding/info | jq .
```

# Onboard

```
DATA=$(jq --arg key "$LICENSE_KEY" '.Common.myLicense.regKey |= $key' requests/do-v1.json)
curl -v -X POST -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/declarative-onboarding
```

# Check status

```
while true; do curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding | jq .result.status; sleep 1; done
```

# Update

```
DATA=$(jq --arg key "$LICENSE_KEY" '.Common.myLicense.regKey |= $key' requests/do-v2.json)
curl -v -X POST -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/declarative-onboarding
```