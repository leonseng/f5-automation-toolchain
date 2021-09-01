# Ensure TS is running

```
curl -sku $CREDS https://$IP/mgmt/shared/telemetry/info
```

# Declare TS
```
curl -X POST -H "Content-Type: application/json" -sku $CREDS --data @requests/ts.json https://$IP/mgmt/shared/telemetry/declare
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
