# @version ^0.4.0

# In solidity, they use require keyword for checking conditions

# A) if-else
num: public(int128)
list1: public(uint256[10])
@deploy
def __init__():
    self.list1= [1,2,3,4,5,6,7,8,9,10]


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
@view
@external
def forLoop()-> (uint128, uint256, uint256):
    num2: uint128=0                  # Local variable so it has default declaration of private
    for i:uint128 in [1,2,3]:        # As i is an iterable and also a variable, and the type of the array is not defined the type also needs to be specified here. The code will not compile otherwise
        num2+= i

    num3: uint256=0
    for i:uint256 in self.list1:    # loop for a state variable
        num3+=i

    num4: uint256=0
    for i:uint256 in range(1,5):     # loop for a range
        num4+=i

    return (num2,num3, num4)
    



# C) break, continue, pass
@pure
@external
def breakContinue()-> uint256:
    x:uint256= 0
    for i:uint256 in [1,2,3,4,5]:
        if i<3:
            continue
        elif i==4:
            break
        else:
            x+=i
    return x



