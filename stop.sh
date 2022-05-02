#!/bin/bash
echo "Stopping HLF-Adapter container..."
docker container stop hlf-adapter
docker container rm hlf-adapter
docker image rm hlf-adapter

echo "Stopping Hyperledger Fabric test network..."
cd  fabric-samples
cd  test-network
./network.sh down

