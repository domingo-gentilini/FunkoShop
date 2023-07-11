const { getAll, getOne } = require('../models/itemsModels');

const getAllItems = async (params) => {

    //logica if else

    const data = await getAll(params);
    return data;

}

//const getOne:/*verificar aca*/

module.exports = {
    getAllItems,
    getOne
};