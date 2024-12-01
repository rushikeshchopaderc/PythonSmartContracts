# version ^0.4.0

# Types of variables
# 1. State variables - Public and Private
# 2. Constant variables - Inbuilt and User defined
# 3. Environment variables - self.balance, msg.sender, msg.value, block.number, block.timestamp, tx.origin

########## State variables
# Public - can be accessed by anyone. These are stored on the blockchain
num: public(int128)

# Private - can be accessed only by this contract and can't be accessed by other smart contracts. Never store sensitive data on blockchain
# Unlike public variable, a private variable does not require any keyword to be defined. Any variable is private by default.
password: String[20]

@deploy
def __init__():
    self.num = 10
    self.password = "password759"

# Name Shadowing - when a state variable and a local variable have the same name. In such cases, the code does not compile.
@external
def nameShadow(num: int128):
    self.num = num  # The first variable is state variable and the second variable is the local variable.
    

########## Constant variables - only for vyper 0.2.0. This has been deprecated in the later versions
# Inbuilt - can be accessed by anyone (zero address, and max uint256)
# from vyper import addresses     # ZERO_ADDRESS has been a constant included in addresses library in vyper 0.3.0
# @pure
# @external
# def GetBuiltinConstants() -> (address, uint256):
#     return(addresses.ZERO_ADDRESS, addresses.MAX_UINT256)
    

    


# User defined - can be accessed only by the contract owner
const_var: constant(int128)= 194

########## Environment variables
# self.balance - stores the Balance of Ether that is stored inthe contract
# msg.sender - Stores the address that calls the function
# msg.value - Complimentary to self.balance. Stores the value of ether that is sent
# block.number - Stores the number of the block in which the function is stored.
# block.timestamp - Stores the timestamp settings of the block
# tx.origin - Stores the address of the Original caller
# Difference b/w tx.origin and msg.sender - Suppose Person A calls smart contract B which calls smart contract C. Then in the contract C,
# tx.origin will store the address of Person A and msg.sender will store the address of smart contract B
@payable
@external
def EnvVariables() ->(uint256, address, uint256, uint256, uint256, address):
    return (self.balance, msg.sender, msg.value, block.number, block.timestamp, tx.origin)

    


