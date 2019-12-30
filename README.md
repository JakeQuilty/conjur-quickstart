# conjur-quickstart

This Quickstart guides you through installation to fetching a secret with a demo app.


Modified to workaround volume mounting issues on Ubuntu.

**Extra steps:**

* Use `docker-compose up -d --build` to also build the NGINX container from the Dockerfile.

* Manually copy files to containers:
    `docker cp ./conf/policy/BotApp.yml conjur_client:/BotApp.yml`
    `docker cp ./program.sh bot_app:/`

* In BotApp container, `export BOT_APP_API_KEY=<api_key>` before running program.sh

`
