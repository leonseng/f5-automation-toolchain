curl -X POST -sku $CREDS --data '
{
  "schemaVersion": "1.0.0",
  "class": "Device",
  "async": true,
  "label": "my BIG-IP declaration for declarative onboarding",
  "Common": {
    "class": "Tenant",
    "mySystem": {
      "class": "System",
      "hostname": "bigip.example.com",
      "cliInactivityTimeout": 1200,
      "consoleInactivityTimeout": 1200,
      "autoPhonehome": false
    },
    "myLicense": {
      "class": "License",
      "licenseType": "regKey",
      "regKey": "'${LICENSE_KEY}'"
    },
    "admin": {
      "class": "User",
      "userType": "regular",
      "shell": "bash"
    },
    "leon": {
      "class": "User",
      "userType": "regular",
      "partitionAccess": {
        "all-partitions": {
          "role": "operator"
        }
      }
    },
    "myProvisioning": {
      "class": "Provision",
      "ltm": "nominal",
      "afm": "nominal",
      "apm": "nominal"
    },
    "internal": {
      "class": "VLAN",
      "tag": 4093,
      "mtu": 1500,
      "interfaces": [
        {
          "name": "1.1",
          "tagged": false
        }
      ],
      "cmpHash": "dst-ip"
    },
    "internal-self": {
      "class": "SelfIp",
      "address": "10.1.10.4/24",
      "vlan": "internal",
      "allowService": "default",
      "trafficGroup": "traffic-group-local-only"
    },
    "external": {
      "class": "VLAN",
      "tag": 4094,
      "mtu": 1500,
      "interfaces": [
        {
          "name": "1.2",
          "tagged": false
        }
      ],
      "cmpHash": "src-ip"
    },
    "external-self": {
      "class": "SelfIp",
      "address": "10.1.20.4/24",
      "vlan": "external",
      "allowService": "none",
      "trafficGroup": "traffic-group-local-only"
    },
    "Route": {
      "class": "Route",
      "gw": "10.1.10.1",
      "network": "192.168.0.0/16"
    }
  }
}' https://$IP/mgmt/shared/declarative-onboarding | jq .