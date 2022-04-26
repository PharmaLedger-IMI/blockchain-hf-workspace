# Purpose:

This repository contains the necessary scripts and tools to instatiate a Hyperledger Blockchain network for development.

# Official Installation script:

The instalation script on this folder is obtained with the information from the Hyperledger repository at: https://hyperledger-fabric.readthedocs.io/en/release-2.1/install.html

We can download and install imediatly the necessary Hyperledger containers and tools by executing the following command:

*curl -sSL https://bit.ly/2ysbOFE | bash -s*

Otherwise Without downloading and running the command immediatly just run:

*curl -sSL https://bit.ly/2ysbOFE > hyperledger.sh*  

This will just download, install and create the docker images, the necessary tools and sample code under the fabric-samples directory.

# Instalation:

Run the *hyperledger.sh* script that was downloaded from the above instructions.

# Configure the environment:

Just run the script configenv.sh with the command *source ./configenv.sh* . *IMPORTANT:* The script should be *sourced* for the environment variables to pass to the global environment.

This just configures the environment with the path to the Hyperledger binaries without the need of a global machine configuration.

# Start the blockchain.

Just run the *start.sh* script.
