//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
import "./Token.sol";
contract BookToken is Token{
    struct Book{
            string title;
            uint price;
        }
        
        mapping(uint=>Book) bookOwnership;

        function setBook(string memory _title, uint _price) public returns(uint){
            uint bookId = mintToken();
            bookOwnership[bookId].title = _title;
            bookOwnership[bookId].price = _price;
            return bookId;
        }

        function buyBook(uint bookId) public payable{
            require(msg.value / 1 ether >=bookOwnership[bookId].price,"Insufficient balance");
            changeOwner(bookId, msg.sender);
        }

        function getBookDetails(uint bookId) public view returns(string memory, uint, address){
            string memory title = bookOwnership[bookId].title;
            uint price = bookOwnership[bookId].price;
            address owner = tokenOwnership[bookId];
            return (title,price,owner);
        }

        function changeOwner(uint tokenId, address newOwner) public override{

        }
}