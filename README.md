# Purpose:

This repository contains the necessary scripts and tools to instatiate a Hyperledger Blockchain network for development.
The installation script also deploys the Anchoring Codechain (Smart Contract) for OpenDSU anchors with the associated node based REST server.

# Installation:

Installation of all the necessary components is achieved by running the *install-all.sh* script. Make sure that you have *git* and *curl* installed.
Notice that the Hyperledger Fabric network is downloaded and installed by executing the Hyperledger installation script from the internet. If security reasons arise download and execute the script manually.

# Starting up and initializing:

Run the *startInit.sh* script only once to create and start the necessary docker containers.
Startup progress can be followed by previously running the *monitordocker.sh* script in another shell window.

This script will download all the necessary docker images for the Hyperledger containers, create the necessary crypto material, deploy the codechain and build, deploy and start the hlf-adapter container.

# Starting:

Run this command only if the system was already initialized with the *startInit.sh* command and it was stopped with the *stop.sh* command. This will start all containers while preserving ledger data.

# Stopping:

Run this command to stop all the system containters, without loosing data.

# Stopping and removing:

Run the *stopDown.sh* command to stop all containers and remove them from the system. This operation will delete all ledger data.

# Configure the environment:

If needed to run Hyperledger commands, just run the script configenv.sh with the command *source ./configenv.sh* . *IMPORTANT:* The script should be *sourced* for the environment variables to pass to the global environment to use the Hyperledger tools

This just configures the environment with the path to the Hyperledger binaries without the need of a global machine configuration to user Organization1.

# TL;DR:

*Start 1st time:*
'./install-all.sh
./startInit.sh'

*Stopping:
'./stop.sh'

*Starting up again:*
'./start.sh'

*Stop all and purge all data:*
'./stopDown.sh'
