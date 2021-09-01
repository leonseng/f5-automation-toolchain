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
sh requests/do-check-status.sh
```

# Update

```
sh requests/do-v2.sh | jq .
```