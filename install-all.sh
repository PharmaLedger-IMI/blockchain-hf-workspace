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
echo "Phase 3: Cleaning up..."
rm hyperledger-install.sh

echo ""
echo "---------------------------------------------------------------------------------------------------------------"
echo "DONE!"
echo "             NOTICE: !!! "
echo "  Start the Hyperledger network with the start.sh script"
echo "  Deploy the anchoring contract with the deploySC.sh script"

echo "Please run on a terminal window the monitordocker.sh script to view Hyperledger logs before running the above commands."
echo "to view operation progress."
