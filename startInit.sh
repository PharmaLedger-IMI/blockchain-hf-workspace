#!/bin/bash
. ./setEnv.sh

echo "Starting up Hyperledger Fabric test network..."
cd  fabric-samples
cd  test-network
./network.sh up -ca
sleep 4
./network.sh createChannel -c anchoring
sleep 2

echo "-----------------------------------------------"
echo "Creating the connection profile for the Hyperledger network..."
organizations/ccp-generate.sh
cp organizations/peerOrganizations/org1.example.com/connection-org1.json ../../config_files
cd ../../
cat config_files/connection-org1.json | sed 's,ca.org1.example.com\":,'rms-ecert-ca\":',g' | sed 's,localhost:7051,peer0.org1.example.com:7051,g' | sed 's,localhost:7054,ca_org1:7054,g' > ./hf-adapter/hlf-adapter/gateway/rms_ccp.json

echo "-----------------------------------------------"
echo "Creating the Identity for the HLF-adapter application..."
./registerusers.sh
sleep 2

echo "-----------------------------------------------"
echo "Adding the affiliation to the network..."
fabric-ca-client affiliation add org1.anchoring  --tls.certfiles "${PWD}/fabric-samples/test-network/organizations/fabric-ca/org1/ca-cert.pem"

echo "-----------------------------------------------"
echo "Deploying the Codechain (Smart contract)..."
./deploySC.sh

sleep 2
echo "-----------------------------------------------"
echo "Checking the Smart Contract..."
./checkSC.sh

peer lifecycle chaincode queryinstalled | grep ID | cut -d' ' -f 3 | cut -d',' -f 1 > CHAINCODE_ID


sleep 2
echo "-----------------------------------------------"
echo "Building the HLF-Adapter docker image..."
cd hf-adapter/hlf-adapter

cat app.js | sed 's,RmsMSP,Org1MSP,g' | sed 's,rms.anchoring,org1.anchoring,g' > work.jsp
cp work.jsp app.js
rm work.jsp

cd utils

cat CAUtil.js | sed 's,RmsMSP,Org1MSP,g' > work.jsp
cp work.jsp CAUtil.js
rm work.jsp

cd ..
docker build -t hlf-adapter .

#
# https://github.com/PharmaLedger-IMI/blockchain-hf-workspace/issues/1#issuecomment-1124976939
# use the qbn-net 172.16.16.16 private IP address for the hlf-adapter.
#
#docker run -dp 3000:3000 --network=fabric_test --name hlf-adapter hlf-adapter
docker network create --driver bridge --subnet 172.16.16.0/24 dsu-bc-net
docker create --restart=always --network=fabric_test --name hlf-adapter hlf-adapter
docker network connect --ip 172.16.16.16 dsu-bc-net hlf-adapter
docker start hlf-adapter
