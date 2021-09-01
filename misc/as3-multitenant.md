# Create declarations across 2 tenants

```
curl -X POST -kvu $CREDS --data '
{
  "class": "AS3",
  "action": "deploy",
  "persist": true,
  "declaration": {
    "class": "ADC",
    "schemaVersion": "3.0.0",
    "id": "example-declaration-01",
    "label": "Sample 1",
    "remark": "Simple HTTP application with round robin pool",
    "Common": {
      "class": "Tenant",
      "Shared": {
        "class": "Application",
        "template": "shared",
        "podinfo_pool": {
          "class": "Pool",
          "monitors": [
            "http"
          ],
          "members": [{
              "servicePort": 9898,
              "serverAddresses": [
                "10.1.10.5"
              ]
            }
          ]
        }
      }
    },
    "Project_A": {
      "class": "Tenant",
      "PodInfo": {
        "class": "Application",
        "podinfo_http": {
          "class": "Service_HTTP",
          "virtualAddresses": [
            "10.1.20.100"
          ],
          "pool": "/Common/Shared/podinfo_pool"
        }
      }
    },
    "Project_B": {
      "class": "Tenant",
      "PodInfo": {
        "class": "Application",
        "podinfo_http": {
          "class": "Service_HTTP",
          "virtualAddresses": [
            "10.1.20.101"
          ],
          "pool": "/Common/Shared/podinfo_pool"
        }
      }
    }
  }
}' https://$IP/mgmt/shared/appsvcs/declare
```

# Updating 1 of multiple tenants

Not specifying Project_B here
```
curl -X POST -kvu $CREDS --data '
{
  "class": "AS3",
  "action": "deploy",
  "persist": true,
  "declaration": {
    "class": "ADC",
    "schemaVersion": "3.0.0",
    "id": "example-declaration-01",
    "label": "Sample 1",
    "remark": "Simple HTTP application with round robin pool",
    "Common": {
      "class": "Tenant",
      "Shared": {
        "class": "Application",
        "template": "shared",
        "podinfo_pool": {
          "class": "Pool",
          "monitors": [
            "http"
          ],
          "members": [{
              "servicePort": 9898,
              "serverAddresses": [
                "10.1.10.5"
              ]
            }
          ]
        }
      }
    },
    "Project_A": {
      "class": "Tenant",
      "PodInfo": {
        "class": "Application",
        "podinfo_http": {
          "class": "Service_HTTP",
          "virtualAddresses": [
            "10.1.20.102"
          ],
          "pool": "/Common/Shared/podinfo_pool"
        }
      }
    }
  }
}' https://$IP/mgmt/shared/appsvcs/declare
```

# Delete single tenant

- Remove all applications in the Project_A tenant
    ```
    curl -X POST -kvu $CREDS --data '
    {
      "class": "AS3",
      "action": "deploy",
      "persist": true,
      "declaration": {
        "class": "ADC",
        "schemaVersion": "3.0.0",
        "id": "example-declaration-01",
        "label": "Sample 1",
        "remark": "Simple HTTP application with round robin pool",
        "Common": {
          "class": "Tenant",
          "Shared": {
            "class": "Application",
            "template": "shared",
            "podinfo_pool": {
              "class": "Pool",
              "monitors": [
                "http"
              ],
              "members": [{
                  "servicePort": 9898,
                  "serverAddresses": [
                    "10.1.10.5"
                  ]
                }
              ]
            }
          }
        },
        "Project_A": {
          "class": "Tenant"
        },
        "Project_B": {
          "class": "Tenant",
          "PodInfo": {
            "class": "Application",
            "podinfo_http": {
              "class": "Service_HTTP",
              "virtualAddresses": [
                "10.1.20.101"
              ],
              "pool": "/Common/Shared/podinfo_pool"
            }
          }
        }
      }
    }' https://$IP/mgmt/shared/appsvcs/declare
    ```
