echo "WARNING: Do not forget to run this script with the source command."
echo ""
if [ -d "$PWD/fabric-samples" ]; then
    export PATH=$PWD/fabric-samples/bin:$PATH
    export FABRIC_CFG_PATH=$PWD/fabric-samples/config/
    export CORE_PEER_TLS_ENABLED=true
    export CORE_PEER_LOCALMSPID="Org1MSP"
    export CORE_PEER_TLS_ROOTCERT_FILE=$PWD/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
    export CORE_PEER_MSPCONFIGPATH=$PWD/fabric-samples/test-network/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
    export CORE_PEER_ADDRESS=localhost:7051
    echo "Environment configured."
else
    echo ""
    echo "ERROR ERROR ERROR ERROR ERROR ERROR"
    echo "" 
    echo "Cannot set environment."
    echo "  Reason:"
    echo "     Hyperledger not instaled, or"
    echo "     Not executing the script on the correct directory"
fi
