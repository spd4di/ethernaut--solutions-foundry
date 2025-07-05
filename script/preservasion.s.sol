// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/preservasion.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        new Attack();
        vm.stopBroadcast();
    }
}