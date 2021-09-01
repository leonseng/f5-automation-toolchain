# Check installation
curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding/info | jq .

# Onboard

```
curl -X POST -sku $CREDS --data @requests/do-v1.json https://$IP/mgmt/shared/declarative-onboarding | jq .
```

# Check status

curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding | jq .

# Update

```
curl -X POST -sku $CREDS --data @requests/do-v2.json https://$IP/mgmt/shared/declarative-onboarding
```