# @version ^0.4.0
x: public(uint256)
owner: public(address)
name: public(String[10])

@deploy
def __init__():
    self.owner=msg.sender

################## Error handling - Assert and Raise #################

@nonpayable
@external
def ErrorWithAssert(x: uint256):
    assert self.owner==msg.sender, 'Not the sender of the contract'
    self.x=x

@nonpayable
@external
def ErrorWithRaise(y: uint256):
    if self.owner!=msg.sender:
        raise 'Not the sender of the contract'
    self.x=y

###################### Bubble up error ###############################
# When 1 function calls anothe function which throws error, then the caller function shows error.
# Whlie running in remix, this code will show error when the function is called from another address other than the one from which the contrat is compiled.
@nonpayable
@internal
def internalErrorWithRaise(name: String[10]):
    if self.owner!=msg.sender:
        raise 'Not the sender of the contract'
    self.name=name

@nonpayable
@external
def BubbleUpFunction():
    self.internalErrorWithRaise("John Doe")
    

##################### Using UNREACHABLE ##############################
# This uses all the gas available in the transaction and then throws an error.
@nonpayable
@external
def unreachableFunction():
    raise UNREACHABLE

    

    
