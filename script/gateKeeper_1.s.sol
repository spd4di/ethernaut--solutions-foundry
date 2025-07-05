// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/gateKeeper_1.sol";
import "forge-std/console.sol";


contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        Attack attackcontract=new Attack();
        console.log("Attack contract deployed at:", address(attackcontract));
        vm.stopBroadcast();
    }
}

contract CallFunction is Script {
    function run() external {
        vm.startBroadcast();
        Attack attackcontract = Attack(address(0xc071B381D7705e1a8D3d8457C9a31d266921e934)); // Replace with actual deployed address
        attackcontract.attack(payable(address(0x3E281BAa0A7AA1aC8bc9B7B9E15d9Fe12587232E)));
        vm.stopBroadcast();
    }
}