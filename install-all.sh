#!/bin/bash

set -e
set -u

echo "This script installs Hyperledger Fabric with associated binary tools and docker images."
echo "It also instatiates the Hyperledger Anchoring version for OpenDSU".

echo ""
echo "---------------------------------------------------------------------------------------------------------------"
echo "Phase 1: Download required software..."
# Using the link documented at https://hyperledger-fabric.readthedocs.io/en/latest/install.html#download-fabric-samples-docker-images-and-binaries
curl -sSL https://bit.ly/2ysbOFE > hyperledger-install.sh
chmod +x hyperledger-install.sh
#
# hf-adapter version from 2022-05-18
# See https://stackoverflow.com/questions/31278902/how-to-shallow-clone-a-specific-commit-with-depth-1
# Needs git >= 2.5.0
#
HLF_ADAPTER_GIT_HASH=ffae36a1d6ce12d1dae4e57a695e46ed038eeb88
mkdir hf-adapter
cd hf-adapter
git init
git remote add origin https://github.com/PharmaLedger-IMI/hf-adapter.git
git fetch --depth 1 origin ${HLF_ADAPTER_GIT_HASH}
git checkout FETCH_HEAD
cd ..

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
echo "  Start the Hyperledger network the first time with the startInit.sh script"

echo "Please run on a terminal window the monitordocker.sh script to view Hyperledger logs before running the above commands."
echo "to view operation progress."
