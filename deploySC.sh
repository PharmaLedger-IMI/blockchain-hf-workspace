#!/bin/bash

source setEnv.sh

PEERSDIR=${PWD}/fabric-samples/test-network/organizations/peerOrganizations

#echo $PEERSDIR

if [ ! -d "$PEERSDIR" ]; then
    echo "You must start the Hyperledger Fabric test network at least once."
    echo "Execute the start.sh script."
    echo " "
    echo "Exiting..."
    exit 1
fi

mkdir work
cp -r hf-adapter/cc-anchor work
cp hf-adapter/env.json work
cp hf-adapter/octopus.json work
cp -r hf-adapter/bin work
cp hf-adapter/package.json work
cp hf-adapter/cc-anchor/Dockerfile work

# Deploy the SmartContract/CodeChain as a Service. 
./fabric-samples/test-network/network.sh deployCCAAS -c anchoring -ccn anchor -ccl javascript -ccp ${PWD}/work

read 

echo "-------------------------------------------------------------------------------------------"
echo "Done!"
echo ""
echo "Run the checkSC.sh script to verify the correct deployment of the Codechain."
echo " Check also the container logs for sucessuful codechain execution"
