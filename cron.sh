#!/bin/bash

cron_name=`kubectl get cronjob | grep auto-delete`

if [[ -n "$cron_name" ]]; then
  echo "cron job found deleting it......"
  kubectl delete cronjob $cron_name
else
  echo "no cron job found creating new....."
  if [[$deploy_name==blue]]; then
    kubectl create cronjob auto-delete --image=busybox '--schedule=0 */12 * * *' -- echo 'kubectl delete deploy example'  
  else
    kubectl create cronjob auto-delete --image=busybox '--schedule=0 */12 * * *' -- echo 'kubectl delete deploy example1'
fi
echo $cron_name


