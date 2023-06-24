const { connection } = require ('../config/connection');

const getAll = async () => {

    const [rows] = await connection.query ('SELECT * FROM producto;');

    return rows;
};

module.exports = {
    getAll 
};