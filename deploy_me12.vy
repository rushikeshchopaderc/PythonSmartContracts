# @version ^0.4.0

owner:public(address)
name: public(String[100])

@deploy
def __init__():                                
    self.owner=msg.sender
    self.name = "Rushikesh Chopade"

 # Remember that this dunder method is not called when the forwarder contract is run. so you need to define a copy of this as shown below

zero_add: address

@external
def setup(name_var: String[100]):
    self.zero_add = 0x0000000000000000000000000000000000000000
    assert self.owner==self.zero_add, "The owner is a Zero Address"
    self.owner= msg.sender
    self.name = name_var
    

