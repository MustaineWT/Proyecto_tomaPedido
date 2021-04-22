var sqlDb = require("mssql");
require("../../config/datosGlobales");

exports.executeSql = function (sql, params, proceso, callback) {
    conn.connect()
        .then(function () {
            if (proceso === 'RegisterUserAdmin') {
                var req = new sqlDb.Request(conn);
                req.input('Name', params.Name);
                req.input('LastName', params.LastName);
                req.input('BussinesName', params.BussinesName);
                req.input('Ruc', params.Ruc);
                req.input('Direction', params.Direction);
                req.input('City', params.City);
                req.input('Country', params.Country);
                req.input('Dni', params.Dni);
                req.input('Phone', params.Phone);
                req.input('EmailCompany', params.EmailCompany);
                req.input('TypePersonId', params.TypePersonId);
                req.input('EmailAdmin', params.EmailAdmin);
                req.input('DirectionAdmin', params.DirectionAdmin);
                req.input('CityAdmin', params.CityAdmin);
                req.input('CountryAdmin', params.CountryAdmin);
                req.input('User_at', params.User_at);
                req.input('Hash_at', params.Hash_at);
                req.execute(sql).then(function (recordset) {
                        callback(recordset.recordset);
                    })
                    .catch(function (err) {
                        console.log(err);
                        callback(null, err);
                    });
            }
            if (proceso === 'RegisterUserSeller') {
                var req = new sqlDb.Request(conn);
                req.input('CompanyId', params.CompanyId);
                req.input('BranchOfficeId', params.BranchOfficeId);
                req.input('Name', params.Name);
                req.input('LastName', params.LastName);
                req.input('Direction', params.Direction);
                req.input('City', params.City);
                req.input('Country', params.Country);
                req.input('Dni', params.Dni);
                req.input('Phone', params.Phone);
                req.input('Email', params.Email);
                req.input('TypePersonId', params.TypePersonId);
                req.input('User_at', params.User_at);
                req.input('Hash_at', params.Hash_at);
                req.execute(sql).then(function (recordset) {
                        callback(recordset.recordset);
                    })
                    .catch(function (err) {
                        console.log(err);
                        callback(null, err);
                    });
            }
            if (proceso === 'SelectUser') {
                var req = new sqlDb.Request(conn);
                req.input('PersonId', params.personid);
                req.execute(sql).then(function (recordset) {
                        callback(recordset.recordset);
                    })
                    .catch(function (err) {
                        console.log(err);
                        callback(null, err);
                    });
            }
            if (proceso === 'SelectUserSeller') {
                var req = new sqlDb.Request(conn);
                req.input('CompanyId', params.CompanyId);
                req.input('BranchOfficeId', params.BranchOfficeId);
                req.execute(sql).then(function (recordset) {
                        callback(recordset.recordset);
                    })
                    .catch(function (err) {
                        console.log(err);
                        callback(null, err);
                    });
            }
        })
        .catch(function (err) {
            console.log(err);
            callback(null, err);
        });
};