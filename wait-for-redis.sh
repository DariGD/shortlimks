#!/bin/bash

until redis-cli -h "$REDIS_HOST" -p "$REDIS_PORT" ping; do
  echo "Ожидание"
  sleep 2
done

echo "Redis доступен"
exec "$@"
