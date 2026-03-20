#!/bin/bash
echo "Running health check test..."

python app.py &
PID=$!

sleep 5

curl -f http://localhost:5000/health
RESULT=$?

kill $PID

if [ $RESULT -eq 0 ]; then
  echo "Tests Passed ✅"
  exit 0
else
  echo "Tests Failed ❌"
  exit 1
fi