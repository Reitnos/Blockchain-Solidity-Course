// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 ;

contract SimpleStorage{

    uint256 num = 5; //default null = 0;
    // bool booly = true;
    // string name = "haha";
    // int256 favint = -5;
    // address adr = 0x6b2a84471DB28a992b830A13eF221480B4d67756;
    // bytes32 favBytes = "cat";
    function store(uint256 newNum) public{
        num = newNum;
    }
    function retrieve() public view returns(uint256){
        return num;
    }

    struct People{
        uint256 favNum;
        string name;
    }

    People[] public people; //dynamic array, can change size

    People public person = People(5,"Furkan");

    function addPerson(string memory _name,uint256 _favNum) public{
        people.push(People(_favNum,_name));
        nameToNum[_name] = _favNum;
    }

    //mapping
    mapping(string => uint256) public nameToNum;

    
}