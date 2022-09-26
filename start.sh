#!/bin/bash
echo "Starting Hyperledger Fabric Network..."
CHAINCODEID=`cat CHAINCODE_ID`
echo $CHAINCODEID

docker run --rm -d --name peer0org1_anchor_ccaas  \
                  --network fabric_test \
                  -e CHAINCODE_SERVER_ADDRESS=0.0.0.0:9999 \
                  -e CHAINCODE_ID=$CHAINCODEID -e CORE_CHAINCODE_ID_NAME=$CHAINCODEID \
                    anchor_ccaas_image:latest

docker run --rm -d --name peer0org2_anchor_ccaas  \
                  --network fabric_test \
                  -e CHAINCODE_SERVER_ADDRESS=0.0.0.0:9999 \
                  -e CHAINCODE_ID=$CHAINCODEID -e CORE_CHAINCODE_ID_NAME=$CHAINCODEID \
                    anchor_ccaas_image:latest

sleep 2
echo "Starting orderers..."
docker container start ca_orderer
docker container start orderer.example.com
sleep 2

echo "Starting CAs..."
docker container start ca_org1
docker container start ca_org2 

sleep 2
echo "Starting peers..."
docker container start peer0.org1.example.com
docker container start peer0.org2.example.com
docker container start cli


sleep 4
echo "Starting HLF-Adapter container..."
docker container start hlf-adapter

