# @version ^0.4.0

bool_var: public(bool)          # Boolean Type
int_var: public(int128)         # Integer Type
int_var2: public(int256)        # Integer Type
string_var: public(String[100]) # String Type Remember to make the 'S' capital as it has specific length.
address_var: public(address)    # This is blockchain address type variable (Specific to blockchain)
bytes_var: public(Bytes[100])   # Bytes Type variable from 0 to 100 bytes. Make sure to make "B" capital as it has specific length.
bytes32_var: public(bytes32)    # Bytes32 Type variable from 32 bytes

# Calling it from constructor/dunder method

@deploy           # Writing this so that the following function can be called via another contract
def __init__(state: bool, int_var: int128, int_var2: int256, string_var: String[100]):     # dunder method: You can pass absolute values in it or you can pass variables.
    self.bool_var= state
    self.int_var= int_var
    self.int_var2= int_var2
    self.string_var= string_var
    self.address_var= 0x0000000000000000000000000000000000000000
    self.bytes_var= b""
    # self.bytes32_var= b"\x01"
    return

@internal
def pass_variables(state: bool, int_var: int128, int_var2: int256, string_var: String[100]) -> String[1000]:
    if state:
        return (concat(b'The boolean state is {state}', " and the integer values are " + int_var, " and ", int_var2, " the string is ", string_var)) 
    else: 
        return (concat("The boolean state is ", state, " so no values are returned"))
        


 


