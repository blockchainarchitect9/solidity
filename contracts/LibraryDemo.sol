//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
library MyLib{
    function add(uint x, uint y) public pure returns(uint){
        return (x+y);
    }
}

contract MyContract{
    using MyLib for uint;
    function sum(uint a, uint b) public pure returns(uint){
        return a.add(b);
    }
}