var sqlDb = require("mssql");
require("../../config/datosGlobales");

exports.executeSql = function (sql, params, proceso, callback) {
  conn
    .connect()
    .then(function () {
      if (proceso === "SelectRoute") {
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
      if (proceso === "RouteInsert") {
        var req = new sqlDb.Request(conn);
        req.input("companyid", params.companyid);
        req.input("branchofficeid", params.branchofficeid);
        req.input("route", params.route);
        req.input("description", params.description);
        req.input("zone", params.zone);
        req.input("ffvv", params.ffvv);
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
      if (proceso === "ClientUpdate") {
        var req = new sqlDb.Request(conn);
        req.input("companyid", params.companyid);
        req.input("branchofficeid", params.branchofficeid);
        req.input("route", params.route);
        req.input("description", params.description);
        req.input("zone", params.zone);
        req.input("ffvv", params.ffvv);
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
      if (proceso === "ClientDelete") {
        var req = new sqlDb.Request(conn);
        req.input("id", params.id);
        req.input("route", params.route);
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
