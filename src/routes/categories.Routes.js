const express = require ('express');
const router = express.Router();  /*creo y llamo express router*/

router.get('/categories', (req, res) => {res.send('ruta para categories');});
router.get('/categories/:categorie', (req, res) => {res.send('ruta para una sola categorie');});

module.exports = router;

