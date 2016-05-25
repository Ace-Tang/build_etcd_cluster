#!/bin/bash

echo "this shell help you change 3 node ip, enter anykey to continue"
read a
echo $1

FILE_1="etcd_1.config"
FILE_2="etcd_2.config"
FILE_3="etcd_3.config"

cp etcd.config $FILE_1
sed -i "s/\<ip\>/$1/g" $FILE_1
cp etcd.config $FILE_2
sed -i "s/\<ip\>/$2/g" $FILE_2
cp etcd.config $FILE_3
sed -i "s/\<ip\>/$3/g" $FILE_3

for j in $(ls etcd_*)
do
	sed -i "s/ip1/$1/g" $j
	sed -i "s/ip2/$2/g" $j
	sed -i "s/ip3/$3/g" $j
done
