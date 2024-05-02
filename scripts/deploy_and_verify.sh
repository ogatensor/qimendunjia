#!/bin/bash

# Define variables
NETWORK_RPC_URL="https://rpc.network.io"
ETHERSCAN_API_KEY="your_etherscan_api_key_here"
CONTRACT_PATH="contracts/MyContract.sol"
CONTRACT_NAME="MyContract"
COMPILER_VERSION="0.8.4"
CONSTRUCTOR_ARGS="0xYourAddressHere 1000"

# Deploy and verify the contract
forge script $CONTRACT_PATH \
--broadcast --rpc-url $NETWORK_RPC_URL \
--verifier-url 'https://api.routescan.io/v2/network/testnet/evm/168587773/etherscan' \
--etherscan-api-key $ETHERSCAN_API_KEY

# Verify the contract if it was already deployed
forge verify-contract $CONTRACT_ADDRESS $CONTRACT_PATH:$CONTRACT_NAME \
--verifier-url 'https://api.routescan.io/v2/network/testnet/evm/168587773/etherscan' \
--etherscan-api-key $ETHERSCAN_API_KEY \
--num-of-optimizations 200 \
--compiler-version $COMPILER_VERSION \
--constructor-args $(cast abi-encode "constructor(address,uint256)" $CONSTRUCTOR_ARGS)