"""
    interfaces are used to call functions from other contracts(smart contract interaction)
    These are optional to import statements in vyper. You can import from other files or write inline interfaces.

    Uses:
    - interfaces for calling another functions(payable, nonpayable, view and non-existing functions)
    - interfaces for smart contract security
    Some additional keyword arguments can also be used with interfaces. They are: 
    1) gas
    2) value
    3) default_return_value
    4) skip_contract_check

    Built-in interfaces:
    Use the built-in interfaces by importing from vyper.interfaces Vyper GitHub repository. These files have extension .vyi and contain all external function dependencies.

"""
# @version ^0.4.0

# declaring the interface
interface Receiver:
    def callMe(message: String[100])-> uint256 : nonpayable
    def getBalance()-> uint256 : view
    def pay() : payable
    def doesNotExist(): nonpayable


# Calling the interface functions from another contracts:

# If you want to use other contract in this contract, you must pass the address of the contract. This is called casting address to interface. So this function has a receiver: address argument.
# The caller function will take the interface as an argument and call the function from the interface
# Either the extcall or staticcall keyword is required to precede the external call to distinguish it from internal calls.
# staticcall for pure and view functions, and extcall for payable and nonpayable functions. Additionally, the output of a staticcall must be assigned to a result.


############### Way 1: Passing the interface as an argument ###############

@external
def GetBalanceFromReceiver(receiver: Receiver)-> uint256:    
    return staticcall receiver.getBalance() # If the interface function is a view/pure function, then you need to use staticcall to call it in this function otherwise extcall


# If the interface function returns a value, we can use a variable to store the value and return it like below or we can return it directly like above

@external
def callReceiver(receiver:Receiver)->uint256:
    num:uint256 = extcall receiver.callMe("Hello World")
    return num


################# Way 2: Passing the interface in __init__ function and using it as a state variable ####################

receiver_contract:Receiver          # declaring a variable of interface type

@deploy
def __init__(receiver_address: address):
    self.receiver_contract = Receiver(receiver_address)

@external
def GetBalanceFromReceiver2()->uint256:
    return staticcall self.receiver_contract.getBalance()

@external
def callReceiver2()->uint256:
    return extcall self.receiver_contract.callMe('Whoooo')    
  
# Example to pay one ether if the input number is 1 otherwise not

@payable
@external
def Test(num: uint256):
    if num==1:
        extcall self.receiver_contract.pay()
    else:
        extcall self.receiver_contract.doesNotExist()


##################### Way 3: Importing an interface from the vyper github repo ####################

# from ethereum.ercs import IERC20

# implements: IERC20



