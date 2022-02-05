#!/bin/bash

$cron_name=`kubectl get cronjob | grep auto-delete`

if [[ -n "$cron_name" ]]; then
  echo "cron job found deleting it......"
  kubectl delete cronjob $cron_name
else
  echo "no cron job found creating new....."
  kubectl cronjob auto-delete --image=busybox '--schedule=* * * * *' -- echo 'kubectl delete deploy example'  
echo $cron_name


