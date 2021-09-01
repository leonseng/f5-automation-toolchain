# Check installation
curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding/info | jq .

# Onboard

```
sh requests/do-v1.sh | jq .
```

# Check status

curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding | jq .

# Update

```
sh requests/do-v2.sh | jq .
```