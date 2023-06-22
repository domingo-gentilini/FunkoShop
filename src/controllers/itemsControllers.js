const items = require('../data/data.js');

const getItems = (req, res) => {
    const { licence } = req.query;
    const itemsFiltered = items.filter(el => el.collection == licence);
    if (itemsFiltered.length == 0) {
        res.send(items);
    }
    res.send(itemsFiltered);
};

const getItem = (req, res) => {
    const itemId = req.params.item;
    const item = items.find(el => el.id == item.Id);
    res.send(item);
};

const createItem = (req, res) => {
    const newItem = req.body;
    items.push(newItem);
    res.send(items);
};

module.exports = {
    getItems,
    getItem,
    createItem
};