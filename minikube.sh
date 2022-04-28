cd hf-adapter
chmod +x ./network/fabric-ccs-build/build-image.sh
chmod +x ./cc-anchor/build-image.sh
chmod +x ./hlf-adapter/build.sh
chmod +x ./epi/build-and-push-epi.sh
chmod +x ./scripts/deploy-network.sh
chmod +x ./scripts/network.sh
chmod +x ./scripts/drop-network.sh
chmod +x ./scripts/hlf-explorer-connection.sh
chmod +x ./scripts/chaincode.sh
chmod +x ./scripts/utils.sh
chmod +x ./scripts/channel.sh
chmod +x ./scripts/hlf-adapter-connection.sh
chmod +x ./scripts/deploy-hlf-adapter.sh
chmod +x ./scripts/fabric-ca.sh

kubectl label nodes minikube cl=hyperledger

