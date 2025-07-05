// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract Attack {

    function attack() external {
        selfdestruct(payable(address(0)));
    }

}

