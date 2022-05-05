#!/bin/bash

echo "Configuring network..."
#cp -r ../fabric-samples/test-network/organizations/ .
ADMINPK=`ls ../fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/Admin\@org1.example.com/msp/keystore/*_sk | cut -d '/' -f 11`
echo ${ADMINPK}

cat connection-profile/template.json | sed "s,PRIVSK,${ADMINPK},g" > connection-profile/test-network.json

# Na ultima versão do docker o compose já faz parte dos comandos do docker
docker compose up -d

# Versão antiga
#docker-compose up

