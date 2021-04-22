var sqlDb = require("mssql");
require('./config');

if (process.env.urlDBSQL === 'Desarrollo') {
    conn = new sqlDb.ConnectionPool({
        user: 'sa',
        password: '18345269',
        server: 'DESKTOP-4BBD76N',
        database: 'DBSALE',
        options: {
            enableArithAbort: true,
        }
    });
}

if (process.env.urlDBSQL === 'DesaCasa') {
    conn = new sqlDb.ConnectionPool({
        user: 'sa',
        password: '18345269',
        server: 'DESKTOP-C9930J1',
        database: 'BDVIRCATEX',
        options: {
            enableArithAbort: true
        }
    });
}

if (process.env.urlDBSQL === 'Produccion') {
    conn = new sqlDb.ConnectionPool({
        user: 'sa',
        password: '183Mus45269taine',
        server: 'ip-172-31-12-30',
        database: 'BDVIRCATEX',
        options: {
            enableArithAbort: true
        }
    });
}