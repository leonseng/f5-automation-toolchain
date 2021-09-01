# Check installation

```
curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding/info | jq .
```

# Onboard

```
sh requests/do-v1.sh | jq .
```

# Check status

```
while true; do curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding | jq .result.status; sleep 1; done
```

# Update

```
sh requests/do-v2.sh | jq .
```