const express = require('express');
const router = express.Router();

const {
homeView,
contactView,
aboutView,
faqsView
} = require ('../controllers/mainControllers') /*no existe Mc aun*/

router.get('/home', (req, res) => res.render('home'));
router.get('/home, contactView');
router.get('/home, aboutView');
router.get('/home, faqsView');

module.exports = router;