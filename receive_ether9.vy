# @version ^0.4.0

"""
- Send and Receive Ether
- Send Ether from externally owned account(EOA) to another account 

__default__() this function is a special type of function. 
This function can't receive any inputs and can not give any outputs. It is used 
1) to receive ether to this contract
2) when a non-existing function is called. e.g. if there is no function named "xyz" then __default__() will be called.

this __default__() function works similar to fallback function in solidity and the send function works like the transfer function in solidity.

"""

# making an event for logging 

event TransferFunds:
    sender: indexed(address)
    amount: uint256
    balance: uint256
    gasLeft: uint256

@payable
@external
def __default__():
    log TransferFunds(msg.sender, msg.value, self.balance, msg.gas)

