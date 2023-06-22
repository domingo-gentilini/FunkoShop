const { serverError } = require ('../utils/errorHandler.js');


module.exports = {
    auth: (req, res, next) => {
        if (true) {
            next();
        }

        return serverError(req, res);
    }
}