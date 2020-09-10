pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
    //The address of the adoption contract to be tested
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    //Testing the adopt() function
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);

        Assert.equal(returnedId, expectedPetId, "adoption of expected pet should match  what is returned");
    }

    //testing the retrieval of a single pet's owner

    function testGetAdopterAdressByPet() public {
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of the expected pet shpuld be this contract");
    }

    //Testing retrieval of all pet owners

function testGetAdopterAddressByPetIdInArray() public {
    //Store adopters in memory rather then contract's storage
address[16] memory adopters = adoption.getAdopters();

Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");

}

    //The id of the pet that will be used for testing
    uint expectedPetId = 8;

    //The expected owner of adopted pet is this contract
    address expectedAdopter = address(this);
}