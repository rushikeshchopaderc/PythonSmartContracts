"""
If we have to deploy certain contract multiple times, and if the contract is complex, it will require a lot of gas.
To reduce the gas cost, we can use the fordwarder functon to deploy the contract. this is 4x cheaper as compared to redeploying the conract

The master contract (deploy_me12.vy) should not implement selfdestruct method. This will delete the original smart contract and hence a forwarder could not be created.
"""

# @version ^0.4.0

# Calling the function via an interface

interface Deployer:
    def setup(name_var: String[100]): nonpayable


@external
def deployAgain(contract_address: address,string_var: String[100])-> address:
    addr: address = create_forwarder_to(contract_address)   # This function gets the address of the deployed contract on the blockchain
    extcall Deployer(addr).setup(string_var)     # Using the deployed contract just like a common interface. i.e importing it like a module and using it 
    return addr




    



