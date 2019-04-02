#!/bin/bash
python manage.py migrate
python manage.py populatedb
# Start Gunicornn  processes
echo Starting Gunicorn.
exec gunicorn api.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 3