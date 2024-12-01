# @version ^0.4.0

# A) if-else
num: public(int128)

@pure
@external
def ifElse(num: int128)-> int128:
    if num < 10:
        return 1
    elif num < 20:
        return 2
    else:
        return 3
    



# B) for loop: array literal, state variable, range
@pure
@external
def forLoop()-> uint128:
    num: uint128=0                  # Local variable so it has default declaration of private
    for i:uint128 in [1,2,3]:        # As i is an iterable and also a variable, the type also needs to be specified here. The code will not compile otherwise
        num+= i
    return num
    



# C) break, continue, pass

