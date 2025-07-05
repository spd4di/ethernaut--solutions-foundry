// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/gkp3.sol";
import "forge-std/console.sol";


contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        new Attack();
        vm.stopBroadcast();
    }
}

contract CallFunction is Script {
    function run() external {
        vm.startBroadcast();
        Attack attackcontract = Attack(address(0x5B614699BF98a130eD2E05Ed4D084da8dC8e5EE6));

        attackcontract.attack();

        vm.stopBroadcast();
    }
}