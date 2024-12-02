# @version ^0.4.0
"""
Send ether to another contract
"""

# Ether is transfered from EOA -> This contract -> to address (receiver)

@payable
@external
def sendEther(to: address):
    # This calls the __default__() function in the reciever function.
    # send function forwards 2300 gas to the receiver in addition to the amount of ether that is sent, which means that the reciever is alloted 2300 gas which it can spend for the transaction
    send(to, msg.value)  # The amount of ether is taken from the environment variable msg.value which will be passed from the remix interface
    
