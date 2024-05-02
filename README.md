## I. Qimen Dunjia (奇門遁甲) Documentation

A random liquidity sniper pointed at BLAST.

The repository includes various components such as Blockchain Indexing, Liquidity Sniping, and Integration with Supabase. The tech stack includes TypeScript, Shell, Python, JavaScript, and Dockerfile. Deployment and operations involve Blast CLI operations and Ethereum-related tasks. The project focuses on blockchain tasks and operations, emphasizing liquidity management and integration with external services like Supabase.

### Project Structure

The project is split into two main packages:
- `ponder`: Contains the blockchain indexer setup.
- `sniper`: Contains the liquidity sniper setup.

## II. Installation Steps: 

- Install dependencies by running `pnpm install`.
- Set up environment variables in `.env`. 

## III. Deployment Steps:
TODO: 
- Set up github actions 
- Set up railway setup

## IV. Connecting to Supabase: 
- Install Supabase dependencies
- Grab Supabase URL and pass it to the appropriate Provider.

## V. CLI Operations on Blast 
- Run the deployment script `deploy_and_verify.sh` for contract deployment.
- Execute the script `eth_to_weth_and_usdb_bridge.sh` for bridging operations.
- Run the script `eth_weth_usdb_yield_operations.sh` for additional yield operations.
- Ensure foundry is installed for Ethereum operations.
- Update the necessary placeholders with actual values in the scripts.
- Execute the CLI commands in `cli.py` for network-related information retrieval.
- Follow the instructions in `check_tx_status.sh` to check transaction status.

## VI. Wallet Configuration: 
- See blast script documentation.

## VII. Additional Operations: 
- See blast script documentation.

## VIII. Project Components
A. Blockchain Indexing
B. Liquidity Sniping
C. Integration with Supabase

## IX. Tech Stack
A. TypeScript
B. Shell
C. Python
D. JavaScript
E. Dockerfile
F. Railway
G. Vercel
H. Supabase
I. Viem
J. Wagmi

## X. Deployment and Operations
A. Blast CLI Operations
B. Ethereum-related Tasks

## XI. Focus of the Project
A. Blockchain Tasks and Operations
B. Emphasis on Liquidity Management
C. Integration with External Services like Supabase

## XII. Conclusion
A. Invitation for Further Exploration or Questions
