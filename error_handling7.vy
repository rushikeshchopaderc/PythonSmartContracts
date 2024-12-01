# @version ^0.4.0

x: public(uint256)
owner: public(address)

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



    

    
