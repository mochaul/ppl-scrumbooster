#!/bin/bash

npm install --global appcenter-cli

flutter build apk --build-name=scrum-booster --build-number=1

appcenter login --token $APP_CENTER_API_KEY

appcenter distribute release -f build/app/outputs/apk/release/app-release.apk --app $APP_CENTER_APP_NAME --group $APP_CENTER_GROUP_TARGET
