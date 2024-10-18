#!/bin/sh
set -e


# Parse command line arguments for --workspace option
# Store other arguments in ARGS for later use
ARGS=""
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --workspace=*) WORKSPACE_DIR="${1#*=}"; shift ;;
        *) ARGS="$ARGS $1"; shift ;;
    esac
done


# Switch to the newly created user and start the main process with all arguments
echo "Starting Siyuan in workspace ${WORKSPACE_DIR}"
exec  /opt/siyuan/kernel --workspace="${WORKSPACE_DIR}" ${ARGS}
