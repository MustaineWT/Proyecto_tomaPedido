var sqlDb = require("mssql");
require("../../config/datosGlobales");

exports.executeSql = function (sql, params, proceso, callback) {
  conn
    .connect()
    .then(function () {
      if (proceso === "SelectZone") {
        var req = new sqlDb.Request(conn);
        req.input("CompanyId", params.companyid);
        req.input("BranchOfficeId", params.branchofficeid);
        req
          .execute(sql)
          .then(function (recordset) {
            callback(recordset.recordset);
          })
          .catch(function (err) {
            console.log(err);
            callback(null, err);
          });
      }
      if (proceso === "ZoneInsert") {
        var req = new sqlDb.Request(conn);
        req.input("CompanyId", params.companyid);
        req.input("BranchOfficeId", params.branchofficeid);
        req.input("Zone", params.zone);
        req.input("Description", params.description);
        req.input("Ffvv", params.ffvv);
        req
          .execute(sql)
          .then(function (recordset) {
            callback(recordset.recordset);
          })
          .catch(function (err) {
            console.log(err);
            callback(null, err);
          });
      }
      if (proceso === "ZoneUpdate") {
        var req = new sqlDb.Request(conn);
        req.input("CompanyId", params.companyid);
        req.input("BranchOfficeId", params.branchofficeid);
        req.input("Zone", params.zone);
        req.input("Description", params.description);
        req.input("Ffvv", params.ffvv);
        req
          .execute(sql)
          .then(function (recordset) {
            callback(recordset.recordset);
          })
          .catch(function (err) {
            console.log(err);
            callback(null, err);
          });
      }
      if (proceso === "ZoneDelete") {
        var req = new sqlDb.Request(conn);
        req.input("CompanyId", params.companyid);
        req.input("BranchOfficeId", params.branchofficeid);
        req.input("Zone", params.zone);
        req
          .execute(sql)
          .then(function (recordset) {
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
