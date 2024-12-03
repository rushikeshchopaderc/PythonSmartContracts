"""
Vyper does not support dynamic arrays. you have to specify the length of the array right at the very start. 
Some examples where dynamic arrays are required include swapping tokens on uniswap.

In such situation you can create a raw_call to swap tokens on uniswap by using dynamic arrays.
Calls for dynamic arrays have to e made usin solidity as vyper deos not support dynamic arrays.

In this example, we will write a contract in solidity and call it here in vyper using raw_call to a solidity function. 
The solidity function used here is raw_call_receiver.sol function
"""

############### 1.  Giving Dynamic arrays as input #################
event Log:
    message: String[100]
    val: uint256

@external
def callTest(test: address, x: uint256, y:uint256):
    raw_call(
        # Takes Arguments:
        # 1.contract address (Here we will use the contract address of the solidity contract raw_call_receiver.sol)
        test, 
        # 2.data
            # method_id (first 4 bytes hash of the func signature). method_id is an inbuilt function to identify the function from the contract_address provided above.
            # inputs: if you want to use uint256, it takes 32 bytes, 32*8=256 bits. These inputs are the values that you want to pass into the solididy function with the above method_id.
        
        concat(
            method_id("test(uint256,uint256)"),
            convert(x, bytes32),
            convert(y, bytes32)
        ),

        # 3.max output size: This contains the output size of the output value that the solidity function returns. If the return values is an int256, then max_output size is 32 bytes.
        max_outsize=0 
    )

    


################ 2. Getting dynamic arrays as output #################


