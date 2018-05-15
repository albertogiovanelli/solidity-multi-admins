const Organisation = artifacts.require('../build/contracts/Organisation.sol');
const ExternalStorage = artifacts.require('../build/contracts/ExternalStorage.sol');
const CreateOrganisation = artifacts.require('../build/contracts/CreateOrganisation.sol');

contract('Organisation', async (accounts) => {

    let organisation;
    let esternalStorage;
    let createOrganization;

    beforeEach('setup contract for each test', async () => {
        //externalStorage = await ExternalStorage.new();
        //organisation = await Organisation.new(externalStorage.address, accounts[0]);
        createOrganization = await CreateOrganisation.new(accounts[0]);
        //esternalStorage = new ExternalStorage();
        //organisation = new Organisation(esternalStorage, accounts[0]);
    });

    /*it("has an admin", async () => {
    assert.equal(await createOrganization.getOrganization()., accounts[0]);
    });*/

    it("Number of admins should be one", async () => {
        console.log(await createOrganization.getNbOfAdmins());
        assert.equal(await createOrganization.getNbOfAdmins(), 1);
    });



});