#!/bin/bash

ROUTER_IP="${1}"

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <router_ip>"
    exit 1
fi

WAIT_TIME=60
RETRIES=3 # x WAIT_TIME < max_ups_time

ping_router() {
    ping -c 1 "${ROUTER_IP}" > /dev/null 2>&1
    return $?
}

# Main loop
failure_count=0
while true; do
    if ping_router; then
        echo "Router is reachable. Waiting for $WAIT_TIME seconds."
        failure_count=0
        sleep $WAIT_TIME
    else
        echo "Router is not reachable. Attempt $((failure_count+1))/$RETRIES."
        failure_count=$((failure_count+1))
        if [[ $failure_count -ge $RETRIES ]]; then
            echo "Router is unreachable after $RETRIES attempts. Initiating graceful server shutdown..."
            sudo shutdown now
            break # useless at this point
        fi
        sleep $WAIT_TIME
    fi
done
