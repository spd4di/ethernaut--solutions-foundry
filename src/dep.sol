// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function totalSupply() external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
}

interface IDetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external;
}

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}
interface CryptoVault {
  

  

    function setUnderlying(address latestToken) external;
    

    /*
    ...
    */

    function sweepToken(IERC20 token) external;
}

contract DetectionBot is IDetectionBot {
    IForta forta;
    CryptoVault vault;

    constructor(address _forta, address _vault) {
        forta = IForta(_forta);
        vault = CryptoVault(_vault);
    }

    function handleTransaction(address user, bytes calldata msgData) external {
        (, , address origSender) = abi.decode(msgData[4:], (address, uint256, address));
        if (origSender == address(vault)) {
            forta.raiseAlert(user);
        }
    } 
}