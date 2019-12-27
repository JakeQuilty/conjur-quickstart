#!/bin/bash
main() {
  if [[ -z "${BOT_APP_API_KEY}" ]]; then
    echo "ERROR: BOT_APP_API_KEY is not found. Run 'export BOT_APP_API_KEY=<api key>'"
    exit 1
  fi
  # get the session token
  curl -s -d "$BOT_APP_API_KEY" -k https://proxy/authn/myConjurAccount/host%2FBotApp%2FmyDemoApp/authenticate > /tmp/conjur_token
  CONT_SESSION_TOKEN=$(cat /tmp/conjur_token| base64 | tr -d '\r\n')
  # fetch the secret with the session token obtained from previous step
  VAR_VALUE=$(curl -s -k -H "Content-Type: application/json" -H "Authorization: Token token=\"$CONT_SESSION_TOKEN\"" https://proxy/secrets/myConjurAccount/variable/BotApp%2FsecretVar)
  echo "The retrieved value is: $VAR_VALUE"
}
main "$@"
exit
