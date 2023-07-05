const { getAll, getOne } = require('../models/itemsModels');

const getAllItems = async (params) => {

    //logica if else

    const data = getAll(params);
    return params;

}

module.exports = {
    getAllItems
}