//SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

contract DAOBank{

    mapping(address=>uint256) public balanceUpdate;

    function deposit() payable public{
        balanceUpdate[msg.sender] += msg.value;
    }

    function withdraw() public{
        uint256 bal = balanceUpdate[msg.sender];
        require(bal>0);

        (bool sent, ) = msg.sender.call{value:bal}("");
        require(sent, "Transaction not successful");

        balanceUpdate[msg.sender] = 0;

    }

}