gh api /repos/suhail-slh/jenkins-tutorial/hooks `
    | jq '.[0].id' `
    | Set-Variable existingWebhookID
gh api --method DELETE /repos/suhail-slh/jenkins-tutorial/hooks/$existingWebhookID
curl.exe -s localhost:4040/api/tunnels `
    | jq -r '.tunnels[0].public_url' `
    | Set-Variable webhookUrl
gh api --method POST /repos/suhail-slh/jenkins-tutorial/hooks `
     -F "active=true" `
     -f "events[]=push" `
     -f "config[url]=$webhookUrl/multibranch-webhook-trigger/invoke?token=" `
     -f "config[content_type]=json" `
     -f "config[insecure_ssl]=0"