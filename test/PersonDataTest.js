const { expect } = require("chai");

describe("PersonData", function () {
  let personData;

  beforeEach(async function () {
    const PersonData = await ethers.getContractFactory("PersonData");
    personData = await PersonData.deploy();
  });

  it("Should add and get person by ID", async function () {
    await personData.addPerson(1234567890123, "John", "Doe", "1234 Main St");
    const person = await personData.getID(1234567890123);
    
    // แสดงข้อมูลใน console
    console.log("Person details:", person);

    expect(person.firstName).to.equal("John");
    expect(person.lastName).to.equal("Doe");
    expect(person.addressDetail).to.equal("1234 Main St");
  });

  it("Should get all persons", async function () {
    await personData.addPerson(1234567890123, "John", "Doe", "1234 Main St");
    await personData.addPerson(9876543210987, "Jane", "Smith", "5678 Oak St");
    const persons = await personData.getAll();
    
    // แสดงข้อมูลใน console
    console.log("All persons:", persons);

    expect(persons.length).to.equal(2);
  });
});
