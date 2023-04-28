#!/bin/bash

sudo docker image rm $(sudo docker image ls --format '{{.Repository}} {{.ID}}' | grep 'admwyx' | awk '{print $2}')

cd cluster/dockerfiles
sudo docker build . -f dinomo-base.dockerfile -t admwyx/dinomo:base
sudo docker push admwyx/dinomo:base

cd cluster
sudo docker build . -f management.dockerfile -t admwyx/dinomo:management
sudo docker push admwyx/dinomo:management

cd ../../../dockerfiles
sudo docker build . -f dinomo.dockerfile -t admwyx/dinomo:kvs
sudo docker push admwyx/dinomo:kvs

sudo docker build . -f clover.dockerfile -t admwyx/dinomo:clover
sudo docker push admwyx/dinomo:clover

sudo docker build . -f asymnvm.dockerfile -t admwyx/dinomo:asymnvm
sudo docker push admwyx/dinomo:asymnvm

cd ../
