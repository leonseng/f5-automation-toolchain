# Check installation

curl -sku $CREDS https://$IP/mgmt/shared/appsvcs/info

# Create declaration

```
curl -X POST -sku $CREDS --data @requests/as3-projectA-v1.json https://$IP/mgmt/shared/appsvcs/declare
```

# Get declaration

curl -sku $CREDS https://$IP/mgmt/shared/appsvcs/declare/Project_A

# Add service

Create another service by posting entire declaration
```
curl -X POST -sku $CREDS --data @requests/as3-projectA-v2.json https://$IP/mgmt/shared/appsvcs/declare
```

# Delete service

Removed `podinfo_https` just by reapplying the original declaration
```
curl -X POST -sku $CREDS --data @requests/as3-projectA-v1.json https://$IP/mgmt/shared/appsvcs/declare
```

# Add new tenant Create another application in a new tenant
```
curl -X POST -sku $CREDS --data @requests/as3-projectB-v1.json https://$IP/mgmt/shared/appsvcs/declare
```

# Delete tenant

Delete tenant by name
```
curl -X DELETE -sku $CREDS https://$IP/mgmt/shared/appsvcs/declare/Project_B
```


# Clean up

```
curl -X DELETE -sku $CREDS https://$IP/mgmt/shared/appsvcs/declare/Project_A
curl -X DELETE -sku $CREDS https://$IP/mgmt/shared/appsvcs/declare/Project_B
```
