//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
contract Bank{
    mapping (address=>uint256) balance;
    mapping (uint=> address) addressIndex;
    uint addressCount;

    address public admin;

    event DepositLog(address, uint);

    modifier balanceCheck(uint amount){
        require(amount<=balance[msg.sender], "Not sufficient amount to withdraw");
        _;
    }

    constructor(){
        admin = msg.sender;
    }

    function deposit() public payable {
        if(balance[msg.sender]==0){
            addressIndex[addressCount++] = msg.sender;            
        }   
        balance[msg.sender] = msg.value; 
        emit DepositLog(msg.sender,msg.value);
    }
    

    modifier onlyAdmin(){
        require(msg.sender==admin, "Access Denied");
        _;
    }

    function withdraw(uint256 amount) public balanceCheck(amount){
        amount = amount * 1 ether;
        balance[msg.sender]-= amount;
        payable(msg.sender).transfer(amount);
    }

    function withdraw(address payable to, uint256 amount) public balanceCheck(amount){
       amount = amount *1 ether;
       balance[msg.sender]-=amount;
       balance[to]+=amount;
       to.transfer(amount);
    }

    function deleteAccount() public onlyAdmin {
        uint accountBalance = balance[msg.sender];
        delete balance[msg.sender];
        payable(msg.sender).transfer(accountBalance);
    }

    function getAccountBalance() public view returns(uint256){
        return balance[msg.sender];
    }

    function getBankBalance() public view returns(uint256){
        return address(this).balance;
    }

    function getAccountBalance(address account) public onlyAdmin view returns(uint256){
        return balance[account];
    }

    function getMaxDeposit() public view onlyAdmin returns(address maxAddress, uint maxBalance){
        address indexAddress;
        for(uint i=0;i<=addressCount;i++){
            indexAddress = addressIndex[i];
            if(balance[indexAddress] > maxBalance){
                maxBalance = balance [indexAddress];
                maxAddress = indexAddress;
            }
        }
    }



}