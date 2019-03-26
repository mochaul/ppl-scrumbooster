#!/bin/bash
python manage.py migrate
# Start Gunicorn processes
echo Starting Gunicorn.
exec gunicorn api.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 3