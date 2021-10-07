Run the following on each member of the cluster

```
# Set the configuration file for the target member in CONF_FILE variable
CONF_FILE=bigip-a.conf.json

IP=$(cat ${CONF_FILE:-conf.json} | jq -r .ip)
CREDS=admin:$(cat ${CONF_FILE:-conf.json} | jq -r .admin_password)

DATA=$(jq --slurpfile c $CONF_FILE '
  .Common.mySystem.hostname |= $c[0].hostname |
  .Common.myLicense.regKey |= $c[0].license_key |
  .Common."internal-self".address |= $c[0].internal_ip |
  .Common."external-self".address |= $c[0].external_ip |
  .Common.default.gw |= $c[0].default_gateway |
  .Common.failoverGroup.members |= $c[0].cluster.failover_group_members |
  .Common.trust.localPassword |= $c[0].admin_password |
  .Common.trust.remotePassword |= $c[0].admin_password
  ' declarative-onboarding/requests/do-dsc.json)
curl -X POST -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/declarative-onboarding
```