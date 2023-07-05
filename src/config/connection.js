/*puede aparecer como db.js o conn.js*/
const mysql = require ('mysql2');
require('dotenv').config();

const pool = mysql.createPool ({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    port: 3306,
    waitForConnections: true,
    connectionLimit: 10,
    maxIdle: 10, 
    idleTimeout: 60000,
    queueLimit: 0, //limite de conexiones (0= infinitas)
    enableKeepAlive: true,
    keepAliveInitialDelay: 0
});

pool.getConnection ((error, connection) => {
    if (error) {
        console.log('----------ERROR EN LA CONEXION CON BASE DE DATOS----------', error);
    } else {
        console.log('----------CONEXION CON BASE DE DATOS EXITOSA----------');
        connection.release();
    }
});

module.exports = {
    connection: pool.promise()
};