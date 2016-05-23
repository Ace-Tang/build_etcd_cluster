#!/bin/bash

cp etcd /usr/local/bin/etcd_init_warpper
cp etcd.service /usr/lib/systemd/system/
cp etcd_.config /etc/sysconfig/etcd
