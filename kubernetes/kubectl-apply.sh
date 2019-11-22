#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash kubectl-apply.sh

logSummary(){
    echo ""
    echo "#####################################################"
    echo "Please find the below useful endpoints,"
    echo "Gateway - http://ui.marvel.34.70.72.55.nip.io"
    echo "Zipkin - http://zipkin.istio-system.34.70.72.55.nip.io"
    echo "Grafana - http://grafana.istio-system.34.70.72.55.nip.io"
    echo "Kiali - http://kiali.istio-system.34.70.72.55.nip.io"
    echo "#####################################################"
}

kubectl apply -f namespace.yml
kubectl label namespace marvel istio-injection=enabled --overwrite=true
kubectl apply -f ui/
kubectl apply -f organization/
kubectl apply -f leave/
kubectl apply -f meeting/
kubectl apply -f notification/

kubectl apply -f istio/
logSummary
