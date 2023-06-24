const express = require ('express');
const router = express.Router();  /*creo y llamo express router*/
const itemsControllers = require ('../controllers/itemsControllers.js') /*vinculo con archivo que controla las rutas*/


router.get('/items', itemsControllers.getItems);
router.get('/items/:item', itemsControllers.getItem);
router.post('/items/create', itemsControllers.createItem);



module.exports = router;

 