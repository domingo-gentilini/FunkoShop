const express = require ("express");
const app = express();
const fs = require ("fs"); 

require('dotenv').config();/*declaro puerto con env*/
const PORT = process.env.PORT; 

const { notFound } = require('./src/utils/errorHandler.js');
const { auth } = require('./src/middlewares/auth.js')

/*import de rutas*/
const itemsRoutes = require('./src/routes/items.Routes.js');
const categoriesRoutes = require('./src/routes/categories.Routes.js');

/*carpeta de archivo estaticos*/
app.use(express.static("public"));
/*carpeta de archivo estaticos*/  
app.use(express.urlencoded());
app.use(express.json());
/*middleware a las rutas*/
app.use('/', auth, itemsRoutes); /* busca autenticacion para ir a items*/
app.use('/', categoriesRoutes); 

/* config del template engines EJS*/
app.set('view engine', 'ejs');
app.set('views', './src/views');

//app.use(notFound);/*mw de app para las rutas*/

app.listen(PORT,() => console.log(`----------CORRIENDO EN PUERTO ${PORT}----------`));
