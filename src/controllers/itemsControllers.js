const { getAll, getOne, getAllItems } = require('../services/itemsServices');

const getItems =  (req, res) => { //aca iba async 
    const items =   getAllItems (); // aca iba await

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