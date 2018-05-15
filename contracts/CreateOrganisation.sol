pragma solidity ^0.4.19;

import "./data/ExternalStorage.sol";

import "./Organisation.sol";

import "./data/DataVerifiable.sol";

import "./libraries/SecurityLibrary.sol";


contract CreateOrganisation {

    Organisation organisation;
    ExternalStorage externalStorage;

    function CreateOrganisation(address _admin){

        externalStorage = new ExternalStorage();

        organisation = new Organisation(externalStorage, _admin);

        externalStorage.changeOwner(organisation);

        organisation.addFirstAdmin(_admin);

    }

    function getNbOfAdmins() public constant returns (uint256) {
        return organisation.getNbOfAdmins();
    }
}