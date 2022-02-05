#!/bin/bash

$cron_name=`kubectl get cronjob`
kubectl create -f cron-job.yaml
echo $cron_name
