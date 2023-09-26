//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
contract Auction{
    address payable public currentLeader;
    uint public highestBid;

    function bid() public payable
    {
        require(msg.value>highestBid, "Try next time");
        (bool sent, ) = currentLeader.call{value: highestBid}("");        
        require(sent, "Failed to send ether");
        highestBid = msg.value;
        currentLeader = payable(msg.sender);
    }
}