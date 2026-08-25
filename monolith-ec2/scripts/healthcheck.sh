#!/bin/bash

for i in {1..12}; do
    if curl -sf http://localhost:8080/actuator/health; then
        echo "Application is healthy"
        exit 0
    fi

    echo "Application not ready yet. Waiting 5 seconds..."
    sleep 5
done

echo "Application failed health check"
exit 1
