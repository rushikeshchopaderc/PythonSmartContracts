# @version ^0.4.0
"""
Signature verification

1. Hash a message to sign
2. Sign the hash offchain using metamask
3. Verify the signature onchain. There are

"""

# 1.for hashing a message to sign
@pure
@external
def getHash(input_string: String[100])-> bytes32:
    return keccak256(input_string)

# 2. Signing the hash is handled by the inspect console in the computer so no code.

# 3. Verifying the signature onchain
# 3.1. Hashing the message with a prefix 
@pure
@external
def EthSignedHash(hash: bytes32)-> bytes32:
    return keccak256(concat(b'\x19Ethereum Signed Message:\n32', hash)) # This is the hash from step 1 which will be hashed again with the prefix
    
# 3.2. Verifying the hash(obtained from Step 3.1) with the signature the customer has done.
@pure
@external
def VerifyHash(ethSignedHash:bytes32, signature: Bytes[65])-> address:
    r: uint256=convert(slice(signature, 0, 32), uint256)    # some elliptic curve coordinates for recovering and returning
    s: uint256=convert(slice(signature, 32, 32), uint256)   # some elliptic curve coordinates for recovering and returning
    v: uint256=convert(slice(signature, 64, 1), uint256)    # This parameter relates to ethereum
    return ecrecover(ethSignedHash, v, r, s)
    
############################################################################################

# For step 2
# press fn+f12 to open the inspect console. Copy the address obtained from step 1 - getHash() function and paste it in the inspect console.
# > hash= "0xda0f7a7cd2a251c1717a0a894a9193e6315a23fbd29f35109f13a51a0bc75e0e"
# > ethereum.enable().then(console.log) # Copy the account hence received and paste as a new variable as shown below
# > account = "{received_account_address_from_above}"
# > ehtereum.request({method:'personal_sign', params=[account, hash]}).then(console.log)
# you will get a final hash that has to be compared with the prefix added hash from Step 3.1
# Use the VerifyHash function to verify the signature -The output will be an address which will be same as the address obtained after ethereum.enable().then(console.log)










    
