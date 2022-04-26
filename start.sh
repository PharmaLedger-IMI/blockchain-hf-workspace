cd  fabric-samples
cd  test-network
./network.sh up
sleep 4
./network.sh createChannel -c anchoring

sleep 4
#./network.sh  deployCC -c anchoring -ccn anchoring -ccp ./hf-adapter/cc-anchor/lib -ccl javascript

