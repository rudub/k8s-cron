#!/bin/bash

$cron_name=`kubectl get cronjob`
kubectl create -f cron-job.yml
echo $cron_name
