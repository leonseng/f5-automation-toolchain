# Setup

```
IP=$(cat conf.json | jq -r .ip)
CREDS=admin:$(cat conf.json | jq -r .admin_password)
```

# Check installation

```
curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding/info | jq .
```

# Onboard

```
DATA=$(jq --slurpfile c config.json '
  .Common.mySystem.hostname |= $c[0].hostname |
  .Common.myLicense.regKey |= $c[0].license_key |
  .Common."internal-self".address |= $c[0].internal_ip |
  .Common."external-self".address |= $c[0].external_ip |
  .Common.default.gw |= $c[0].default_gateway |
  .Common.default.gw |= $c[0].default_gateway |
  ' requests/do-v1.json)
curl -X POST -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/declarative-onboarding
```

# Check status

```
while true; do curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding | jq .result.status; sleep 1; done
```

# Update

```
DATA=$(jq --slurpfile c config.json '
  .Common.mySystem.hostname |= $c[0].hostname |
  .Common.myLicense.regKey |= $c[0].license_key |
  .Common."internal-self".address |= $c[0].internal_ip |
  .Common."external-self".address |= $c[0].external_ip |
  .Common.default.gw |= $c[0].default_gateway |
  .Common.default.gw |= $c[0].default_gateway |
  ' requests/do-v2.json)
curl -X POST -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/declarative-onboarding
```

# Clean Up

```
DATA=$(jq --slurpfile c config.json '
  .Common.mySystem.hostname |= $c[0].hostname |
  .Common.myLicense.regKey |= $c[0].license_key |
  .Common."internal-self".address |= $c[0].internal_ip |
  .Common."external-self".address |= $c[0].external_ip |
  .Common.default.gw |= $c[0].default_gateway |
  .Common.default.gw |= $c[0].default_gateway |
  ' requests/do-v1.json)
curl -X POST -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/declarative-onboarding
```