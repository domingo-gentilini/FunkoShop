const express = require ("express");
const app = express();
const fs = require ("fs"); 
const PORT = 3000;
const itemsRoutes = require('./src/routes/itemsRoutes.js');
const categoriesRoutes = require('./src/routes/categoriesRoutes.js');

app.use(express.static("public"));

app.use('/', itemsRoutes);
app.use('/', categoriesRoutes); 

app.listen(PORT,() => console.log(`corriendo en puerto ${PORT}`));
