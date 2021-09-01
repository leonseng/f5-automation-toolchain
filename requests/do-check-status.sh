while true; do curl -sku $CREDS https://$IP/mgmt/shared/declarative-onboarding | jq .result.status; sleep 1; done
