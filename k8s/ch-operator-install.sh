#!/bin/bash -e

OPERATOR_NS=${OPERATOR_NS:-kube-system}
kubectl apply -f https://raw.githubusercontent.com/Altinity/clickhouse-operator/master/deploy/operator/clickhouse-operator-install.yaml -n $OPERATOR_NS