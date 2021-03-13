var sqlDb = require("mssql");
require("../../config/datosGlobales");

exports.executeSql = function (sql,params,proceso,callback) {
    conn.connect()
        .then(function () {
            if(proceso==='ListClient'){
                
                var req = new sqlDb.Request(conn);
                req.input('CompanyId',params.companyid);
                req.input('BranchOfficeId',params.branchofficeid);
                req.execute(sql).then(function (recordset) {
                    callback(recordset.recordset);
                })
                .catch(function (err) {
                    console.log(err);
                    callback(null, err);
                });
            }
            if(proceso==='ClientInsert'){
                var req = new sqlDb.Request(conn);
                req.input('companyid',params.companyid);
                req.input('branchofficeid',params.branchofficeid);
                req.input('ruc',params.ruc);
                req.input('bussinesname',params.bussinesname);
                req.input('email',params.email);
                req.input('phone',params.phone);
                req.input('direction',params.direction);
                req.input('directionfiscal',params.directionfiscal);
                req.input('modulo',params.modulo);
                req.input('order_at',params.order_at);
                req.input('latitude',params.latitude);
                req.input('longitude',params.longitude);
                req.input('distance',params.distance);
                req.input('subgiro',params.subgiro);
                req.input('giro',params.giro);
                req.input('listprice',params.listprice);
                req.input('perceptionflag',params.perceptionflag);
                req.execute(sql).then(function (recordset) {
                    callback(recordset.recordset);
                })
                .catch(function (err) {
                    console.log(err);
                    callback(null, err);
                });
            }
            if(proceso==='ClientUpdate'){
                var req = new sqlDb.Request(conn);
                req.input('companyid',params.companyid);
                req.input('branchofficeid',params.branchofficeid);
                req.input('ruc',params.ruc);
                req.input('bussinesname',params.bussinesname);
                req.input('email',params.email);
                req.input('phone',params.phone);
                req.input('direction',params.direction);
                req.input('directionfiscal',params.directionfiscal);
                req.input('modulo',params.modulo);
                req.input('order_at',params.order_at);
                req.input('latitude',params.latitude);
                req.input('longitude',params.longitude);
                req.input('distance',params.distance);
                req.input('subgiro',params.subgiro);
                req.input('giro',params.giro);
                req.input('listprice',params.listprice);
                req.input('perceptionflag',params.perceptionflag);
                req.execute(sql).then(function (recordset) {
                    callback(recordset.recordset);
                })
                .catch(function (err) {
                    console.log(err);
                    callback(null, err);
                });
            }
            if(proceso==='ClientDelete'){
                var req = new sqlDb.Request(conn);
                req.input('id',params.id);
                req.input('codclient',params.codclient);
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
