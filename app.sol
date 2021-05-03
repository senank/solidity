// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract Counter {
    uint public counter = 0; //alternative to constructor

    // If not using the assign ^ must include this here
    // constructor() {
    //     counter = 0;
    // }
    

    // Alternative to public attribute counter i.e. uint counter;
    // function getCount() public view returns(uint) {
    //     return counter;
    // }

    function addOne() public {
        counter ++;
    }

}

// Defininng structures
contract Structure{
    struct MyStruct {
        uint myInt;
        string myString;
    }
    
    MyStruct public myStruct = MyStruct(1, 'foo');

}


// Array data structures
contract Array{
    uint[] public uintArray = [1, 2, 3];
    string[] public stringArray = ['foo', 'bar', 'baz'];
    uint[][] public array2D = [[1, 2, 3], [3, 4, 5]];

    function addValue(string memory _value) public {
        stringArray.push(_value);
    }

    function stringLength() public view returns(uint) {
        return stringArray.length;
    }
}

// Mapping data structures i.e. dictionaries
contract Mapping{
    // mapping(key => value) myMapping; specify datatype for key and value
    mapping(uint => string) public names;
    mapping(uint => Investment) public investment;
    
    // nested mapping 
    mapping(address => mapping(uint => Investment)) public myInvestments; // assigning investments to address

    struct Investment{
        string company;
        uint amount;
    }

    constructor() {
        names[1] = 'Adam';
        names[2] = 'Bob';
    }

    function addInvestment(uint _id, string memory _company, uint _amount) public {
        investment[_id] = Investment(_company, _amount);
    }


    //Nested Mapping
    function addInvestmentCurrentUser(uint _id, string memory _company, uint _amount) public {
        myInvestments[msg.sender][_id] = Investment(_company, _amount);
    }
}

