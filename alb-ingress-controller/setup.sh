#!/bin/bash
read -p "Enter EKS cluster name: " cluster_name

read -p "Enter EKS vpc id: " vpc_id

template="$(cat alb-ingress-controller.yaml.tmpl)"
eval "echo \"${template}\" > alb-ingress-controller.yaml"

kubectl apply -f rbac-role.yaml

kubectl apply -f alb-ingress-controller.yaml
