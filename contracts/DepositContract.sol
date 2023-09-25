//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
contract DepositContract{
    uint256 public balance;
    event depositEvent(address indexed,uint256);

    function deposit() public payable{
        balance += msg.value;
        emit depositEvent(msg.sender,msg.value);
    }
}