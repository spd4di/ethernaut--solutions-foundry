// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/coin_flip.sol";

contract CoinFlip is Script {
    function run() external {
        vm.startBroadcast();
        Attack attack = Attack(0xfB1423B384965D7A38baAeC8E5854c702487Da78); // 替换为实际 Attack 合约地址
        attack.attack();
        vm.stopBroadcast();
    }
}