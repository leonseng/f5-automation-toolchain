# Check installation

curl -kvu $CREDS https://$IP/mgmt/shared/appsvcs/info

# Create declaration

```
curl -X POST -kvu $CREDS --data @requests/projectA-v1.json https://$IP/mgmt/shared/appsvcs/declare
```

# Get declaration

curl -kvu $CREDS https://$IP/mgmt/shared/appsvcs/declare/Project_A

# Add service

Create another service by posting entire declaration
```
curl -X POST -kvu $CREDS --data @requests/projectA-v2.json https://$IP/mgmt/shared/appsvcs/declare
```

# Delete service

Removed `podinfo_https` just by reapplying the original declaration
```
curl -X POST -kvu $CREDS --data @requests/projectA-v1.json https://$IP/mgmt/shared/appsvcs/declare
```

# Add new tenant Create another application in a new tenant
```
curl -X POST -kvu $CREDS --data @requests/projectB-v1.json https://$IP/mgmt/shared/appsvcs/declare
```

# Delete tenant

Delete tenant by name
```
curl -X DELETE -kvu $CREDS https://$IP/mgmt/shared/appsvcs/declare/Project_B
```


