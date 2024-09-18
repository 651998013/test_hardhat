// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract PersonData {
    struct Person {
        string firstName;
        string lastName;
        string addressDetail;
    }

    mapping(uint256 => Person) private persons;  // เก็บข้อมูลโดยใช้เลขที่บัตรประชาชนเป็น key
    uint256[] private ids;  // เก็บรายชื่อ ID ทั้งหมด

    // ฟังก์ชันเพิ่มข้อมูลบุคคลใหม่
    function addPerson(
        uint256 idCard,
        string memory firstName,
        string memory lastName,
        string memory addressDetail
    ) public {
        require(bytes(persons[idCard].firstName).length == 0, "This ID already exists.");  // ตรวจสอบว่า string เป็นค่าว่างหรือไม่
        persons[idCard] = Person(firstName, lastName, addressDetail);
        ids.push(idCard);  // เก็บ ID ลงใน array
    }

    // ฟังก์ชันแสดงข้อมูลทั้งหมด
    function getAll() public view returns (Person[] memory) {
        Person[] memory allPersons = new Person[](ids.length);
        for (uint256 i = 0; i < ids.length; i++) {
            allPersons[i] = persons[ids[i]];
        }
        return allPersons;
    }

    // ฟังก์ชันแสดงข้อมูลตามเลขที่บัตรประชาชน
    function getID(uint256 idCard) public view returns (Person memory) {
        require(bytes(persons[idCard].firstName).length != 0, "This ID does not exist.");
        return persons[idCard];
    }
}
