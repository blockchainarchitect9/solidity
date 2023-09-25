//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
contract A {
    string msgA;
    function setMsgA(string memory _msg) public{
        msgA = _msg;
    }

    function getMsgA() public view returns(string memory){
        return msgA;
    }
}

contract B{
    string msgB;

    event createdA(address);
    function getMsgFromA(address contractAddress) public view returns(string memory){
        A objA = A(contractAddress);
        return objA.getMsgA();
    }

    function setMsgFromA(address contractAddress, string memory _msg) public{
           A objA = A(contractAddress);
           objA.setMsgA(_msg);
    }

    function createA() public returns(address){
        A obj = new A();
        emit createdA(address(obj));
        return address(obj);
    }
    fallback() external{

    }
    receive() external payable{
        
    }
}