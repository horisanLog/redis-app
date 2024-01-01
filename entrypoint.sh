#!/bin/bash
set -e

rm -f /redis_app/tmp/pids/server.pid

exec "$@"
