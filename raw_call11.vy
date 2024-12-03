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
    message:String[100]
    value: uint256


@external
def callTest(test: address, x: uint256, y:uint256):
    res: Bytes[128] = raw_call(
        # Takes Arguments:
        # 1.contract address (Here we will use the contract address of the solidity contract raw_call_receiver.sol)
        test, 
        # 2.data
            # method_id (first 4 bytes hash of the func signature). method_id is an inbuilt function to identify the function from the contract_address provided above.
            # inputs: if you want to use uint256, it takes 32 bytes, 32*8=256 bits. These inputs are the values that you want to pass into the solididy function with the above method_id.
        
        concat(
            method_id("test(uint256,uint256,uint256[])"),
            convert(x, bytes32),
            convert(y, bytes32), 
            # For declaring the dynamic size in vyper, we use offset. It is the memory in bytes used before this dynamic array.
            convert(96, bytes32), # offset, 3 arguments with 32 bytes each, 32*3=96
            convert(2,bytes32), # for the length of the argument - uint256[] dynamic array. If you want to have 100 elements, then it is 100
            # now that there are two elements in the array as set in the above line, give those two elements as converted values below. If you have to pass 100 values, use 100 convert statements after this
            convert(71, bytes32), # uint256[0] = 71
            convert(85, bytes32)  # uint256[1] = 85
        ),

        # 3.max output size: This contains the output size of the output value. The total length of the concat is 32*4 128 Bytes.
        max_outsize=128 # 32 bytes each for x, y, xs_array[0] and xs_array[1]
    )

# For getting dynamic arrays as output you need to assign the raw_call function to a variable with total size defined in bytes

    # Extracting the values from the res array hence formed by raw_call
    offset:uint256 = extract32(res, 0, output_type=uint256 )
    length:uint256 = extract32(res, 32, output_type=uint256)
    y0:uint256 = extract32(res, 64, output_type=uint256)
    y1:uint256 = extract32(res, 96, output_type=uint256)

    log Log("Offset",offset)
    log Log("Length", length)
    log Log("y0", y0)
    log Log("y1", y1)

