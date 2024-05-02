#!/bin/bash

# Bash: check_tx_status.sh

# Prompt for user input
read -p "Enter your Infura key: " INFURA_KEY
read -p "Enter your transaction hash: " TX_HASH

# Check if jq is installed
if ! command -v jq &> /dev/null
then
    echo "jq could not be found. Please install it and try again."
    exit
fi

# Define a function to send a JSON-RPC request
send_json_rpc() {
    local method=$1
    local params=$2
    local id=$3

    curl -s -X POST https://sepolia.infura.io/v3/$INFURA_KEY \
        -H "Content-Type: application/json" \
        --data @- << EOF
{
    "jsonrpc": "2.0",
    "method": "$method",
    "params": $params,
    "id": $id
}
EOF
}

# Get the transaction receipt
receipt=$(send_json_rpc "eth_getTransactionReceipt" "[\"$TX_HASH\"]" 1)

# Check if the transaction was found
if [ "$(echo "$receipt" | jq -r '.result')" == "null" ]; then
    echo "Transaction not found. Please check your transaction hash and try again."
    exit
fi

# Get the block number of the transaction
blockNumber=$(echo "$receipt" | jq -r '.result.blockNumber')

# Get the latest safe block number
safeBlockNumber=$(send_json_rpc "eth_getBlockByNumber" "[\"safe\", false]" 2 | jq -r '.result.number')

# Compare the block numbers to determine the status of the transaction
if [ "$blockNumber" == "null" ]; then
    echo "Transaction is pending."
elif [ "$((blockNumber))" -gt "$((safeBlockNumber))" ]; then
    echo "Transaction is sequencer confirmed / unsafe."
elif [ "$((blockNumber))" -le "$((safeBlockNumber))" ]; then
    echo "Transaction is published to Ethereum / safe."
else
    echo "Unknown transaction status."
fi