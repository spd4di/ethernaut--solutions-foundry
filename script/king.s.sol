// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/King.sol";
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
        Attack attackcontract = Attack(payable(address(0x144d881055527D6e597bB73ABB32B29c10De0e7e)));
        //gain the king title
        attackcontract.attack{value: 0.11 ether}(payable(address(0x686aD678823D3B8E0a2980b9A21e5181bd2e14CD)));

        vm.stopBroadcast();
    }
}