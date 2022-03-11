#!/bin/bash
gunicorn --bind 8000 --workers 4 --worker-class saleor.asgi.gunicorn_worker.UvicornWorker saleor.asgi:application &

celery -A saleor --app=saleor.celeryconf:app worker --loglevel=info -B &

wait -n

exist $?