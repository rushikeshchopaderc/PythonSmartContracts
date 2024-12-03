pragma solidity ^0.8.0;

// SPDX-License-Identifier: MIT
// defining which liscence is applied to the contract.

contract RawCallReceiver {
    event Log(uint x, uint y);

    function test(uint x, uint y) external{
        emit Log(x, y);
    }
}
