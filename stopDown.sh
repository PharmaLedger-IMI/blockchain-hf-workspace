#!/bin/bash
echo "Stopping and removing the HLF-Adapter container..."
docker container stop hlf-adapter
docker container rm hlf-adapter
docker image rm hlf-adapter
docker network rm qbn-net

echo "Stopping and removing the Hyperledger Fabric test network..."
cd  fabric-samples
cd  test-network
./network.sh down

