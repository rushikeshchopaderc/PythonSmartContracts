"""
Vyper does not support dynamic arrays. you have to specify the length of the array right at the very start. 
Some examples where dynamic arrays are required include swapping tokens on uniswap.

In such situation you can create a raw_call to swap tokens on uniswap by using dynamic arrays.
Calls for dynamic arrays have to e made usin solidity as vyper deos not support dynamic arrays.
"""

############### 1.  Giving Dynamic arrays as input #################


################ 2. Getting dynamic arrays as output #################


