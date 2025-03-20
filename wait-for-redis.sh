until redis-cli -h redis ping; do
  echo "Waiting for Redis to be ready..."
  sleep 2
done


until pg_isready -h db -U postgres; do
  echo "Waiting for PostgreSQL to be ready..."
  sleep 2
done


exec "$@"