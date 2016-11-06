#!/bin/bash
# docker image quay.io/coreos/etcd

HostIP=""
ETCD_VERSION="latest"
TOKEN="etcd_cluster_1"

docker run -d --net=host --name etcd -p 2380:2380 -p 2379:2379 quay.io/coreos/etcd:${ETCD_VERSION} \
    /usr/local/bin/etcd \
    --data-dir=data.etcd --name etcd0 \
    --initial-advertise-peer-urls http://${HostIP}:2380 --listen-peer-urls http://${HostIP}:2380 \
    --advertise-client-urls http://${HostIP}:2379 --listen-client-urls http://${HostIP}:2379 \
    --initial-cluster etcd0=http://${HostIP}:2380 \
    --initial-cluster-state new --initial-cluster-token ${TOKEN}

