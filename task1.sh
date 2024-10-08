pgrep -f "bash infinite.sh" && echo "Terminating processes..." && pkill -f "bash infinite.sh" && echo "Processes terminated." || echo "No matching processes found."
