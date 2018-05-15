const ExternalStorage = artifacts.require('../build/contracts/ExternalStorage.sol');
const SecurityLibrary = artifacts.require('../build/contracts/SecurityLibrary.sol');
const Organisation = artifacts.require('../build/contracts/Organisation.sol');
const CreateOrganisation = artifacts.require('../build/contracts/CreateOrganisation.sol');
module.exports = function (deployer, network, accounts) {

    deployer.deploy(ExternalStorage).then(function () {

        return deployer.deploy(SecurityLibrary).then(function () {

            deployer.link(SecurityLibrary, Organisation);

            return deployer.deploy(Organisation, ExternalStorage.address, accounts[0]).then(function () {

                deployer.link(Organisation, CreateOrganisation);
                deployer.link(ExternalStorage, CreateOrganisation);
                deployer.link(SecurityLibrary, CreateOrganisation);

                return deployer.deploy(CreateOrganisation, ExternalStorage.address, Organisation.address, accounts[0]).then(()=>{

                    }).catch(err => console.log("Error occured while deploying CreateOrganisation.sol", err));


            }).catch(err => console.log("Error occured while deploying Organisation.sol", err));

        }).catch(err => console.log("Error occured while deploying SecurityLibrary.sol", err));

    }).catch(err => console.log("Error occured while deploying ExternalStorage.sol", err));

};