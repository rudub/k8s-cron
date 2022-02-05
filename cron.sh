#!/bin/bash
color=$1
cron_name=`kubectl get cronjob | grep auto-delete`
echo $color
if [[ -n "$cron_name" ]]; then
  echo "cron job found deleting it......"
  kubectl delete cronjob $cron_name
else
  echo "no cron job found creating new....."
  if [[ "$color" == "blue" ]]; then
    echo "deployment found Blue...."
    kubectl create cronjob auto-delete --image=busybox '--schedule=0 * * * *' -- echo 'kubectl delete deploy nginx-green'  
  else
    echo "deployment found green.."
    kubectl create cronjob auto-delete --image=busybox '--schedule=0 * * * *' -- echo 'kubectl delete deploy nginx-blue'
  fi
fi
kubectl get pods
echo $cron_name


