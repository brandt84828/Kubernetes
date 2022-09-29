#!/bin/bash


ip link delete flannel.1
systemctl restart network

for ip in 192.168.187.{101..102}
do
	ssh root@$ip "ip link delete flannel.1
	systemctl restart network
	"
	
done

kubectl delete -f /root/kube-flannel.yml
kubectl apply -f /root/kube-flannel.yml
