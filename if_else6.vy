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
    



# B) for loop

# C) break, continue, pass

