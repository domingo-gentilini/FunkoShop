const { connection } = require ('../config/connection');

const getAll = async () => {

    const [rows, fields] = await connection.query ('SELECT * FROM producto;');

    return rows, fields;
};
const getOne = async (params) => {

    const { id } = req.params;
    res.json({
        id,
        //nombre
    });

    return getOne;
};
module.exports = {
    getAll,
    getOne
};