// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/building.sol";
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
        Attack attackcontract = Attack(address(0xDe6DAC1092B5Eb74469Bdc1d682cf8Fd5c9B032f));
        attackcontract.attack(0x8d2921349AaE040e89Bda4F7c619E8F99B2f4F80);
        vm.stopBroadcast();
    }
}