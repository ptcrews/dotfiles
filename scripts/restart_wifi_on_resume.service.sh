#!/bin/sh
cp ./restart_wifi_on_resume.service /etc/systemd/system/
systemctl enable restart_wifi_on_resume.service
