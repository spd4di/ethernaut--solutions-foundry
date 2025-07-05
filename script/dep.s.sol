// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/dep.sol";
import "forge-std/console.sol";


contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        new DetectionBot(address(0xe3B62D199a8DDb263EEf7Ee65644cB5f430fE415), address(0x2867F083FE938EE9bBa6f49096c6ab834C3D9462));
        
       
        vm.stopBroadcast();
    }
}