module.exports = {
    // using ganache
    networks: {
        development: {
            host: "127.0.0.1",
            port: 7545, // to connect to Ganache
            network_id: "*", // Match any network id

        }
    }
};
