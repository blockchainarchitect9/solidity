//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
contract GlobalDemo{
    address public owner;
    address public contractAddress;
    uint256 public amount;
    uint256 public time;

    function setMsgParameters() public payable{
        owner = msg.sender;
        contractAddress = address(this);
        amount = msg.value;
        time = block.timestamp;
    }

    function getContractBalance() public view returns(uint256){
        return address(this).balance;
    }
    
}