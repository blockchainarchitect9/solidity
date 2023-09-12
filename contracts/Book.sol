//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
contract Book{
    struct MyBook{
        string title;
        uint8 price;
        bool sold;
    }
   
    MyBook public myBook;
    address public owner;
    address[] public buyers;
   
    uint256 public buyersCount;
  
    
    function setBook(string memory _title, uint8 _price) public{
        myBook.title = _title;
        myBook.price = _price;
        myBook.sold = false;
    }

    function ethertoWei(uint256 e) internal pure returns(uint256){
        return (e*1000000000000000000);
    }

    function buyBook() public payable{
        require(msg.value >= ethertoWei(myBook.price),"Insufficient Amount");
        owner = msg.sender;
        buyers.push(owner);
        myBook.sold = true;
        uint256 balance = msg.value - ethertoWei(myBook.price);
        if(balance>0){
            payable(msg.sender).transfer(balance);
        }
        buyersCount = buyers.length;
    }
}