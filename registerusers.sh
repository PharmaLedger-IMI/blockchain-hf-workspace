#!/bin/bash

cd  fabric-samples
cd  test-network

echo "Creating the identities for the hlf-adapter: rcaadmin and hlfRmsUser"
fabric-ca-client enroll -u https://admin:adminpw@localhost:7054 --caname ca-org1 --tls.certfiles "${PWD}/organizations/fabric-ca/org1/ca-cert.pem"

#fabric-ca-client register --caname ca-org1 --id.name rcaadmin --id.secret rcaadminpw --id.type admin --tls.certfiles "${PWD}/organizations/fabric-ca/org1/ca-cert.pem" 
fabric-ca-client register --caname ca-org1 --id.name hlfRmsUser --id.secret hlfRmsUserpw --id.type client --tls.certfiles "${PWD}/organizations/fabric-ca/org1/ca-cert.pem"

#fabric-ca-client enroll -u https://rcaadmin:rcaadminpw@localhost:7054 --caname ca-org1 -M "${PWD}/organizations/peerOrganizations/org1.example.com/users/Rcaadmin@org1.example.com/msp" --tls.certfiles "${PWD}/organizations/fabric-ca/org1/ca-cert.pem"
cp "${PWD}/organizations/peerOrganizations/org1.example.com/msp/config.yaml" "${PWD}/organizations/peerOrganizations/org1.example.com/users/Rcaadmin@org1.example.com/msp/config.yaml"

fabric-ca-client enroll -u https://hlfRmsUser:hlfRmsUserpw@localhost:7054 --caname ca-org1 -M "${PWD}/organizations/peerOrganizations/org1.example.com/users/Hlfrmsuser@org1.example.com/msp" --tls.certfiles "${PWD}/organizations/fabric-ca/org1/ca-cert.pem"
cp "${PWD}/organizations/peerOrganizations/org1.example.com/msp/config.yaml" "${PWD}/organizations/peerOrganizations/org1.example.com/users/Hlfrmsuser@org1.example.com/msp/config.yaml"

