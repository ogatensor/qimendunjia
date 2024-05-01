## Qimen Dunjia (奇門遁甲)

A random liquidity sniper pointed at BLAST.

### Project Structure

The project is split into two main packages:
- `indexer`: Contains the blockchain indexer setup.
- `sniper`: Contains the liquidity sniper setup.

Packages are independent projects below the root level.
## Installation Steps: 

- Install dependencies by running `pnpm install`.
- Set up environment variables in `.env`. 

## Deployment Steps:
TODO: 
- Set up github actions 
- Set up railway setup

## Connecting to Supabase: 
- Install Supabase dependencies
- Grab Supabase URL and pass it to the appropriate Provider.

## CLI Operations on Blast 
- Run the deployment script deploy_and_verify.sh for contract deployment.
- Execute the script eth_to_weth_and_usdb_bridge.sh for bridging operations.
- Run the script eth_weth_usdb_yield_operations.sh for additional yield operations.
- Ensure foundry is installed for Ethereum operations.
- Update the necessary placeholders with actual values in the scripts.
- Execute the CLI commands in cli.py for network-related information retrieval.
- Follow the instructions in check_tx_status.sh to check transaction status.

## Wallet Configuration: 
- See blast script documentation.

## Additional Operations: 
- See blast script documentation.
