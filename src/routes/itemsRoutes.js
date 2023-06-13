const express = require ('express');
const router = express.Router();  /*creo y llamo express router*/

router.get('/items', (req, res) => {res.send('ruta para items');});
router.get('/items/:item', (req, res) => {
    const data = req.body;
    res.send(data);
});
router.post('/items/create', (req, res) => {res.send('ruta para crear un item');});
router.put('/items/:item', (req, res) => {res.send('ruta para modificar un item');});
router.delete('/items/:item', (req, res) => {res.send('ruta para borrar un item');});
router.get('/items', (req, res) => {res.send('ruta para item');});
router.get('/items', (req, res) => {res.send('ruta para item');});

module.exports = router;

 