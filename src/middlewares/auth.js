const { serverError } = require ('../utils/errorHandler');


module.exports = {
    auth: (req, res, next) => {
        if (true) {
            next();
        }

        return serverError(req, res);
    }
}