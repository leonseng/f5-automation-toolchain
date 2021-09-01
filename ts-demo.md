# Ensure TS is running

```
curl -sku $CREDS https://$IP/mgmt/shared/telemetry/info
```

# Declare TS
```
DATA=$(jq \
  --arg a "$TS_APP_INSIGHT_INSTRUMENTATION_KEY" \
  --arg b "$TS_LOG_ANALYTICS_WORKSPACE_ID" \
  --arg c "$TS_LOG_ANALYTICS_WORKSPACE_SHARED_KEY" \
  '
    .My_Metric_Consumer.instrumentationKey |= $a |
    .My_Log_Consumer.workspaceId |= $b |
    .My_Log_Consumer.passphrase.cipherText |= $c
  ' \
  requests/ts.json)

curl -X POST -H "Content-Type: application/json" -sku $CREDS --data "$DATA" https://$IP/mgmt/shared/telemetry/declare
```

Check F5_virtualServers_/Project_A/PodInfo/podInfo_https_totRequests on App Insight

# Configure event logging

Configure event listener
```
curl -X POST -sku $CREDS --data @requests/as3-common.json https://$IP/mgmt/shared/appsvcs/declare
```

Configure logging profile on application
```
curl -X POST -sku $CREDS --data @requests/as3-projectA-v3.json https://$IP/mgmt/shared/appsvcs/declare
```
