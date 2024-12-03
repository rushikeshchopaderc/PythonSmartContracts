"""
Vyper does not support dynamic arrays. you have to specify the length of the array right at the very start. 
Some examples where dynamic arrays are required include swapping tokens on uniswap.

In such situation you can create a raw_call to swap tokens on uniswap by using dynamic arrays.
"""

