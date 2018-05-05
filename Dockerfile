FROM rabbitmq:3-management

ADD init.sh /init.sh
# Admin's UI
EXPOSE 15672
# Message queue
EXPOSE 5672

# Custom init script
ENTRYPOINT ["/init.sh"]
