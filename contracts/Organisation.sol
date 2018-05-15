pragma solidity ^0.4.19;

import "./data/ExternalStorage.sol";
import "./data/DataVerifiable.sol";
import "./libraries/SecurityLibrary.sol";

contract Organisation is DataVerifiable {

    using SecurityLibrary for address;

    function Organisation(
    address _externalStorageContract,
    address _admin
    )
    public
    {
        externalStorage = _externalStorageContract;

        admin = _admin;

        owner = msg.sender;

    }

    function addAdmin(address _admin) public only_admins {
        externalStorage.addAdmin(_admin);
    }

    function addFirstAdmin(address _admin) public only_owner {
        externalStorage.addAdmin(_admin);
    }

    function getNbOfAdmins() public returns(uint256 admins) {
        return externalStorage.getNbOfAdmins();
    }

    /// Ensure sender is part of admin group
    modifier only_admins {require(externalStorage.isUserAdmin(msg.sender));
        _;}

    /// Ensure sender is current admin
    modifier only_admin {require(msg.sender == admin);
        _;}

    /// Ensure sender is current admin
    modifier only_owner {require(msg.sender == owner);
        _;}

    address public externalStorage;

    address public admin;

    address public owner;

}