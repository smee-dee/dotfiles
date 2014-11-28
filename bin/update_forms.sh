#!/bin/bash

cd
mongoexport --host 176.28.24.80 --db forms_service_production --collection forms --out forms.dump
mongoimport --drop --db forms_service_development --collection forms --file forms.dump
rm forms.dump
touch /Documents/kp_frontend/tmp/restart.txt