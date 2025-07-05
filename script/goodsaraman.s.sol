// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/goodsaraman.sol";
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
        Attack attackcontract = Attack(address(0x1b4C2945F65303856aEcCd570a460a98abe8Aa7f));
        attackcontract.attack();

        vm.stopBroadcast();
    }
}