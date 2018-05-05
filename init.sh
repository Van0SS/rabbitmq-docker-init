#!/bin/sh

# Create client user in a separate waiting thread
# TODO use more robust approach
( sleep 30 ; \
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD 2>/dev/null ; \
rabbitmqctl set_user_tags $RABBITMQ_USER user ; \
# Only write and read for needed.permissions exchanges
rabbitmqctl set_permissions -p / $RABBITMQ_USER  "^needed.permissions*" "^needed.permissions.*" "^needed.permissions.*" ; \
echo "*** User '$RABBITMQ_USER' with password '$RABBITMQ_PASSWORD' completed. ***" ; \
echo "*** Log in the WebUI at port 15672 (example: http:/localhost:15672) ***";) &

# Run the original docker-entrypoint.sh with "rabbitmq-server" parameter.
docker-entrypoint.sh rabbitmq-server
