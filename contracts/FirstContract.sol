//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
contract FirstContract{
    uint256 num;
    function setNum(uint256 _num) public {
        num = _num;
    }
    function getNum() public view returns(uint256){
        return num;
    }
}
