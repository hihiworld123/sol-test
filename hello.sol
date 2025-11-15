// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


contract Hello3Dot0 {

    // string public  hello ="hello 3.0!";

    // int public account = -1*2**255;

    // uint public a2 = 2**256-1;

    // bool public flag = false;

    // bool public flag2 = true;

    // address public  addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // bytes2 public  b2 = hex"1000";

    // bytes3 public  b3 = hex"100000";

    // enum Status{
    //     Active,
    //     Inactive
    // }


    // int[] public arr;

    // string[] public arr2;

    // bool[] public arr3;

    // address[] public arr4;
    // bytes10[] public arr5;

    // string public str ="hello";

    // struct Person {
    //     uint8 age;
    //     bool sex;
    //     string name;
    // }

    // Person public p = Person(10,false,"Tom");


    string private hello = "hello";

    function sayHello(string memory name) public view returns(string memory){
        return string.concat(hello,name);
    }






}