const mysql = require('mysql');

const connection = mysql.createConnection({
    host: process.env.URL_DATA || 'localhost',
    port: process.env.PORT_DATA || 3306,
    user: process.env.USER_DATA || 'root',
    password: process.env.PSW_DATA || '',
    database: process.env.DATABASE_NAME || 'estoque_mateus'
});

module.exports = connection;

