#!/bin/bash

set -e
set -u


echo "This script installs Hyperledger Fabric with associated binary tools and docker images."
echo "It also instatiates the Hyperledger Anchoring version for OpenDSU".

echo ""
echo "---------------------------------------------------------------------------------------------------------------"
echo "Phase 1: Download required software..."
curl -sSL https://bit.ly/2ysbOFE > hyperledger-install.sh
chmod +x hyperledger-install.sh
git clone https://github.com/PharmaLedger-IMI/hf-adapter.git

echo ""
echo "---------------------------------------------------------------------------------------------------------------"
echo "Phase 2: Installing Hyperledger Fabric samples and test network for Docker containers..."
./hyperledger-install.sh

echo ""
echo "---------------------------------------------------------------------------------------------------------------"
echo "Phase 3: Building docker images..."
cd hf-adapter
docker build -t hf:anchor_hf_cc.0.1 -f ./cc-anchor/Dockerfile .
cd network/fabric-ccs-build
docker build -t hf:fabric-ccs-build.1.0 -f Dockerfile .
cd ../..
