const { connection } = require ('../config/connection');

const getAll = async () => {

    const [rows, fields] = await connection.query ('SELECT * FROM producto;');

    return rows, fields;
};
const getOne = async (params) => {

    const [rows, fields] = await connection.query ('SELECT * FROM producto WHERE ?;', params); //reemplaza ? x params.id

    return rows, fields;
};
module.exports = {
    getAll,
    getOne
};