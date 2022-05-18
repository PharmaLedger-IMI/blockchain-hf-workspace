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

echo "If you saw errors such as 'Error: No such volume: docker_orderer.example.com' or 'ERROR: error while removing network: network fabric_test id ... has active endpoints' please consider manually running 'docker volume prune' or 'docker network prune'"
