#!/bin/bash
set -e

SERVICE_NAME=raspi-metrics

echo "Installing raspi-metrics"
poetry install

echo "Copying service to systemd"
sudo cp service/raspi-metrics.service /etc/systemd/system/

echo "Reloading systemd units..."
sudo systemctl daemon-reload

echo "Enabling $SERVICE_NAME to start on boot..."
sudo systemctl enable $SERVICE_NAME

echo "Restarting $SERVICE_NAME..."
sudo systemctl restart $SERVICE_NAME

echo "Showing status..."
sudo systemctl status $SERVICE_NAME --no-pager
