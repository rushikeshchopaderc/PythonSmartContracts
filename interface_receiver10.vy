"""
    interfaces are used to call functions from other contracts(smart contract interaction). 
    These are optional to import statements in vyper. You can import from other files or write inline interfaces.
    Uses:
    - interfaces for calling another functions(payable, nonpayable, view and non-existing functions)
    - interfaces for smart contract security

"""

event Log:
    sender: indexed(address)
    message: String[100]

event Payment:
    sender: indexed(address)
    amount: uint256

@nonpayable
@external
def __default__():
    log Log(msg.sender, "Function does not exist")

@view
@external
def getBalance()-> uint256:
    return self.balance

@nonpayable
@external
def callMe(message: String[100])-> uint256:
    log Log(msg.sender, message)
    return 123

@payable
@external
def pay():
    log Payment(msg.sender, msg.value)


    


    






