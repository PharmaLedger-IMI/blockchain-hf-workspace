#!/bin/bash

echo "Starting up Hyperledger Fabric test network..."
cd  fabric-samples
cd  test-network
./network.sh up -ca
sleep 4
./network.sh createChannel -c anchoring
sleep 2

echo "Creating the identities for the hlf-adapter: rcaadmin and hlfRmsUser"
fabric-ca-client enroll -u https://admin:adminpw@localhost:7054 --caname ca-org1 --tls.certfiles "${PWD}/organizations/fabric-ca/org1/ca-cert.pem"
fabric-ca-client register --caname ca-org1 --id.name rcaadmin --id.secret rcaadminpw --id.type admin --tls.certfiles "${PWD}/organizations/fabric-ca/org1/ca-cert.pem" --id.affiliation="Org1"

#fabric-ca-client enroll -u https://hlfRmsUser:hlfRmsUserPw@localhost:7054 --caname ca-org1 --tls.certfiles "${PWD}/organizations/fabric-ca/org1/ca-cert.pem"
fabric-ca-client register --caname ca-org1 --id.name hlfRmsUser --id.secret hlfRmsUserpw --id.type client --tls.certfiles "${PWD}/organizations/fabric-ca/org1/ca-cert.pem" --id.affiliation=Org1

echo "Creating the connection profile for the Hyperledger network..."
organizations/ccp-generate.sh
cp organizations/peerOrganizations/org1.example.com/connection-org1.json ../../config_files
cd ../../
cat config_files/connection-org1.json | sed 's,ca.org1.example.com\":,'rms-ecert-ca\":',g' > ./hf-adapter/hlf-adapter/gateway/rms_ccp.json

