pragma solidity ^0.8.0;

// SPDX-License-Identifier: MIT
// defining which liscence is applied to the contract.

contract RawCallReceiver {
    event Log(uint x, uint y);

    // The last argument of the function is a dynamic array
    function test(uint x, uint y, uint[] calldata xs_array) external{
        require(x == y, "Values are not equal");
        emit Log(x, y);
    }

}
