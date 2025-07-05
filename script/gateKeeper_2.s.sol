// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/gateKeeper_2.sol";
import "forge-std/console.sol";


contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        Attack attackcontract=new Attack();
        console.log("Attack contract deployed at:", address(attackcontract));
        vm.stopBroadcast();
    }
}

