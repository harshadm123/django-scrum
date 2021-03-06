#!/bin/sh

# wait for RabbitMQ server to start
while ! nc -w 1 -z rabbitmq 5672; do sleep 5; done

rm ./celerybeat.pid

# Run celery beat with circus project manager with configurations in an ini file. 
circusd circus_beat.ini