//SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
contract Cert{

address admin;
constructor(){
    admin = msg.sender;
}

    struct Certificate{
        string name;
        string course;
        string grade;
        string date;
    }

    modifier onlyAdmin(){
        require(admin==msg.sender,"Only admins can call this function");
        _;
    }

    mapping(uint256=>Certificate) public Certificates;

    function issueCertificate(uint256 _id,string memory _name, string memory _course, string memory _grade, string memory _date) public onlyAdmin{
        Certificates[_id] = Certificate(_name,_course,_grade, _date);
    }


}