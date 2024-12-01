#@version ^0.4.0

# Events allow you to record that something happened on the blockchain... Events are used to send notifications to the user interface and cheap storage

######################## 1. sent notifications to user interface 

# Once the event is triggered, it will be stored on the blockchain and a notification will be sent when an event is fired using log command

event TransferFunds:    
    sender: indexed(address)     # Maximum 3 indexes are allowed per event. indexed variable lets one filter the event on that variable
    to: address
    amount: uint256

@nonpayable
@external
def transfer(to: address, amount: uint256):
    log TransferFunds(msg.sender, to, amount)


##################### 2. cheap storage, cannot access inside smart contracts but it will be stored on the blockchain
# Give and revoke the authorization of users based on conditions will take less memory on the blockchain

authorized: public(HashMap[address, bool])
event Authorized:    
    addr: indexed(address)     
    authorized: bool 

@nonpayable
@external
def grantAuthorization(addr: address):
    assert self.authorized[msg.sender], "Not authorized"
    self.authorized[addr] = True
    log Authorized(addr, True)

@nonpayable
@external
def revokeAuthorization(addr: address):
    assert self.authorized[msg.sender], "Not authorized"
    self.authorized[addr] = False
    log Authorized(addr, False)



