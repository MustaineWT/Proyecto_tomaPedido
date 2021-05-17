var sqlDb = require("mssql");
require("../../config/datosGlobales");

exports.executeSql = function (sql, params, proceso, callback) {
  conn
    .connect()
    .then(function () {
      if (proceso === "SelectFfvv") {
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
      if (proceso === "FfvvInsert") {
        var req = new sqlDb.Request(conn);
        req.input("CompanyId", params.companyid);
        req.input("BranchOfficeId", params.branchofficeid);
        req.input("Ffvv", params.ffvv);
        req.input("Description", params.description);
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
      if (proceso === "FfvvUpdate") {
        var req = new sqlDb.Request(conn);
        req.input("CompanyId", params.companyid);
        req.input("BranchOfficeId", params.branchofficeid);
        req.input("Ffvv", params.ffvv);
        req.input("Description", params.description);
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
      if (proceso === "FfvvDelete") {
        var req = new sqlDb.Request(conn);
        req.input("CompanyId", params.companyid);
        req.input("BranchOfficeId", params.branchofficeid);
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
    })
    .catch(function (err) {
      console.log(err);
      callback(null, err);
    });
};
