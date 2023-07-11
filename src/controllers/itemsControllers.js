const { getAll, getAllItems } = require('../services/itemsServices');
const { getOne } = require('../models/itemsModels');

const getItems =  async (req, res) => {
    const items = await getAllItems ();

    res.send(items);
};

 function getItem(req, res) {
    const id = req.params.id;
console.log(id);
const item =  getOne({id_producto : id});
res.send(item);
};

function createItem(req, res) {
    res.send("items");
};

module.exports = {
    getItems,
    getItem,
    createItem
};