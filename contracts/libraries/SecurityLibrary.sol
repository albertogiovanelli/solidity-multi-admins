pragma solidity ^0.4.19;

import "../data/ExternalStorage.sol";

library SecurityLibrary
{
    event AdminAdded(address _user);
    event AdminRemoved(address _user);

    function addAdmin(address _storageContract, address _user) public {
        ExternalStorage(_storageContract).setBooleanValue(keccak256('admin:', _user), true);

        // Increment the admins count in storage
        var adminsCount = ExternalStorage(_storageContract).getUIntValue(keccak256("AdminsCount"));
        ExternalStorage(_storageContract).setUIntValue(keccak256("AdminsCount"), adminsCount + 1);

        AdminAdded(_user);
    }

    function removeAdmin(address _storageContract, address _user)  public {
        require(isUserAdmin(_storageContract,_user)==true);
        uint adminsCount = getNbOfAdmins(_storageContract);
        require(adminsCount>1);
        ExternalStorage(_storageContract).deleteBooleanValue(keccak256('admin:', _user));

        // Decrement the admins count in storage
        adminsCount-=1;
        ExternalStorage(_storageContract).setUIntValue(keccak256("AdminsCount"), adminsCount);

        ExternalStorage(_user);
    }

    function isUserAdmin(address _storageContract, address _user) public constant returns (bool)  {
        return ExternalStorage(_storageContract).getBooleanValue(keccak256('admin:', _user));
    }

    function getNbOfAdmins(address _storageContract) public constant returns(uint256 admins)  {
        return ExternalStorage(_storageContract).getUIntValue(keccak256("AdminsCount"));
    }


}
