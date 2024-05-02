import requests
import click

BASE_URL = "https://api.routescan.io/v2/network"

@click.group()
def cli():
    pass

@cli.command()
@click.argument('network_id')
@click.argument('chain_id')
def get_addresses(network_id, chain_id):
    response = requests.get(f"{BASE_URL}/{network_id}/evm/{chain_id}/addresses")
    print(response.json())

@cli.command()
@click.argument('network_id')
@click.argument('chain_id')
@click.argument('address')
def get_erc20_holdings(network_id, chain_id, address):
    response = requests.get(f"{BASE_URL}/{network_id}/evm/{chain_id}/address/{address}/erc20-holdings")
    print(response.json())

@cli.command()
@click.argument('network_id')
@click.argument('chain_id')
@click.argument('address')
def get_erc721_tokens(network_id, chain_id, address):
    response = requests.get(f"{BASE_URL}/{network_id}/evm/{chain_id}/erc721/{address}/tokens")
    print(response.json())

@cli.command()
@click.argument('network_id')
@click.argument('chain_id')
@click.argument('transaction_id')
def get_transaction(network_id, chain_id, transaction_id):
    response = requests.get(f"{BASE_URL}/{network_id}/evm/{chain_id}/transactions/{transaction_id}")
    print(response.json())

if __name__ == "__main__":
    cli()