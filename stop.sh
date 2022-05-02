#!/bin/bash
echo "Stopping HLF-Adapter container..."
docker container stop hlf-adapter

echo "Stopping Hyperledger Fabric Network..."
docker container stop peer0org1_anchor_ccaas
docker container stop peer0org2_anchor_ccaas
docker container stop cli
docker container stop orderer.example.com
docker container stop peer0.org1.example.com
docker container stop peer0.org2.example.com
docker container stop ca_orderer
docker container stop ca_org1
docker container stop ca_org2 
