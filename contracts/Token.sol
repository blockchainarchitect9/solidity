//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
contract Token{
    mapping(uint=>address) tokenOwnership;

    function mintToken() public returns(uint){
        uint tokenId = block.timestamp;
        tokenOwnership[tokenId] = msg.sender;
        return tokenId;
    }

    function getOwner(uint tokenId) public view returns(address){
        return tokenOwnership[tokenId];
    }

    function changeOwner(uint tokenId, address newOwner) public virtual{
        tokenOwnership[tokenId] = newOwner;
    }


}

