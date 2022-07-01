#!/bin/bash
echo "Stopping and removing the HLF-Adapter container..."
docker container stop hlf-adapter
docker container rm hlf-adapter
docker image rm hlf-adapter
docker network rm dsu-bc-net

echo "Stopping and removing the Hyperledger Fabric test network..."
cd  fabric-samples
cd  test-network
./network.sh down

echo "Doing one last round of checks to see if everything was deleted..."

if [[ "$(docker volume ls | grep "example.com")" ]]; then
  echo "Clearing lingering volumes..."
  docker volume rm $(docker volume ls | grep "example.com" | awk '{print $2}')
fi

if [[ "$(docker network ls | grep "fabric")" ]]; then
  echo "Clearing lingering networks..."
  docker network rm $(docker network ls | grep "fabric" | awk '{print $1}')
fi

if [[ "$(docker image ls | grep "anchor_ccaas")" ]]; then
  echo "Clearing image caches..."
  docker image rm $(docker image ls | grep "anchor_ccaas" | awk '{print $3}')
fi

echo "If you saw errors such as 'Error: No such volume: docker_orderer.example.com' or 'ERROR: error while removing network: network fabric_test id ... has active endpoints' please consider manually running 'docker volume prune' or 'docker network prune'"
