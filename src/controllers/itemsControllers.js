const { getAll } = require ('../models/items');

const getItems = async (req, res) => {
    const items = await getAll();
    res.send(items);
};

const getItem = (req, res) => {
    res.send("item");
};

const createItem = (req, res) => {
    res.send("items");
};

module.exports = {
    getItems,
    getItem,
    createItem
};