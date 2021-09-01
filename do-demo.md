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
sh do-check-status.sh
```

# Update

```
sh requests/do-v2.sh | jq .
```