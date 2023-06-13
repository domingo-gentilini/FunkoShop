const express = require(`express`);
const app = express();
const PORT = 3001;

app.use(express.static("public"));

app.listen (PORT, () => console.log(`server corriendo en puerto ${PORT}`)); /*definir puerto y mostrar mensaje*/