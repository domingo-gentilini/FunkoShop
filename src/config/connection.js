/*puede aparecer como db.js o conn.js*/
const mysql = require ('mysql2');

const pool = mysql.createPool ({
    host: 'localhost',
    user: 'root',
    password: 'mysqlroot963.',
    database: 'funkoshop',
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
    conn: pool.promise()
};