#!/bin/bash
sleep 5
cd /home/admin/

echo worker_count=${worker_count} >> .env
echo backlog=${backlog} >> .env

docker compose up -d
sleep 30
