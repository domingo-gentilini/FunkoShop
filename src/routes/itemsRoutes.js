const express = require ('express');
const router = express.Router();  /*creo y llamo express router*/
const itemsControllers = require ('../controllers/itemsControllers.js') /*vinculo con archivo que controla las rutas*/


router.get('/items', itemsControllers.getItems);
router.get('/items/:item', itemsControllers.getItem);
router.post('/items/create', itemsControllers.createItem);

/*router.put('/items/:item', (req, res) => {res.send('ruta para modificar un item');});
router.delete('/items/:item', (req, res) => {res.send('ruta para borrar un item');});
router.get('/items', (req, res) => {res.send('ruta para item');});
router.get('/items', (req, res) => {res.send('ruta para item');});*/

module.exports = router;

 