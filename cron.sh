#!/bin/bash

$cron_name=`kubectl get cronjob`
kubectl create cronjob auto-delete --image=busybox   --schedule="*/1 * * * *" -- echo "kubectl delete deploy example"
echo $cron_name
