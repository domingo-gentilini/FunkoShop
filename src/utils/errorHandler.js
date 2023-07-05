const path = require ('path'); //unir __dirname con ruta

module.exports = {
    notFound: (req, res, next) => {
        
        res.status(404).sendFile(path.resolve(__dirname, "../../public/pages/404.html"));
    },
    serverError: (req, res, next) => {
        res.status(500).send("----------EL SERVIDOR NO FUNCIONA ERR500----------")
    },
};