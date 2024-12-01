# @version ^0.4.0

# A) Visibility : who can view this function (internal- only be called inside the contract, external - can only be calledfrom outside the contract)

# If not mentioned, the function is internal by default
@internal
@pure
def intFun(x: int256, y: int256)-> int256:
    return (x + y)


@external
@view
def extFun(x: int256)->int256:
    # The internal function can be called from here but the otherway around is not possible
    a: int256= 1
    b: int256= 2
    y: int256= x * self.intFun(a,b)
    # log("The value of y is " + y)
    return y


#################################################################################################################


# B)mutability: 1) @payable - writes to contract storage and receives Eth, 2) @nonpayable: Only writes to the contract storage, changes the variable, 
#3) @view: Reads, but does not write, contract storage, 4) @view: Does not read/write from contract storage. It can’t read the environment variables/ state variables, nothing.

@external
@pure
def purFun(x: int256)->bool:
    return x>2


num: public(int256)
@external
@view
def viewFun(x: int256)->(int256, address):
    return (x+self.num, msg.sender) # The first one is the state variable and the second one is environment variable


message: public(String[100])
@external 
@nonpayable #By default a function is nonpayable. You can choose not to define the mutability in case of a nonpayable function
def nonPayFun(message:String[100]) -> String[150]:
    self.message = message
    return ("Hello ") # This is a print statement in vyper

value: public(uint256)
@external
@payable
def receiveEther():
    self.value = msg.value      #msg.value is an environment variable
    return
    
# A function that pays ether to another address
owner: public(address)
@deploy
@payable
def __init__():
    self.owner=msg.sender       #msg.sender is an environment variable
    self.value= msg.value

    