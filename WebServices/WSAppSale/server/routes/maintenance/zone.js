const express = require("express");
var db = require("../../sql/maintenanceSQL/zoneSQL");
const app = express();
const { verificaToken } = require("../../middlewares/autenticacion");

app.post("/Api/v1/Zone", verificaToken, (req, res) => {
  const query = `SI_Zone`;
  let body = req.body;
  if (
    body.CompanyId == undefined ||
    body.BranchOfficeId == undefined ||
    body.Zone == undefined ||
    body.Description == undefined ||
    body.Ffvv == undefined
  ) {
    return res.json({
      status: false,
      response: "Debe ingresar todos los parametros.",
    });
  } else {
    params = {
      companyid: body.CompanyId,
      branchofficeid: body.BranchOfficeId,
      zone: body.Zone,
      description: body.Description,
      ffvv: body.Ffvv,
    };
    db.executeSql(query, params, "ZoneInsert", (response, err) => {
      if (err) {
        return res.status(500).json({
          status: false,
          err: err,
        });
      }
      if (response[0]["Response"] === "Ya Existe Zone") {
        return res.status(400).json({
          status: false,
          message: "Ruta ya existe.",
        });
      }
      res.json({
        status: true,
        message: "Proceso Completado.",
      });
    });
  }
});

app.get("/Api/v1/Zone", verificaToken, (req, res) => {
  const query = "SS_Zone";
  let body = req.query;
  if (body.CompanyId == undefined || body.BranchOfficeId == undefined) {
    return res.json({
      status: false,
      message: "Debe ingresar los parametros correctos.",
    });
  } else {
    params = {
      companyid: body.CompanyId,
      branchofficeid: body.BranchOfficeId,
    };

    db.executeSql(query, params, "SelectZone", (zone, err) => {
      if (err) {
        return res.status(500).json({
          status: false,
          err: {},
        });
      }
      if (zone.length > 0) {
        res.json({
          status: true,
          zone: zone,
          message: "Solicitud Exitosa.",
        });
      } else {
        res.json({
          status: false,
          zone: [],
        });
      }
    });
  }
});

app.delete("/Api/v1/Zone", verificaToken, (req, res) => {
  const query = `SD_Zone`;
  let body = req.body;
  if (
    body.CompanyId == undefined ||
    body.BranchOfficeId == undefined ||
    body.Zone == undefined
  ) {
    return res.json({
      status: false,
      message: "Debe ingresar todos los parametros.",
    });
  } else {
    params = {
      companyid: body.CompanyId,
      branchofficeid: body.BranchOfficeId,
      zone: body.Zone,
    };
    db.executeSql(query, params, "ZoneDelete", (response, err) => {
      if (err) {
        return res.status(500).json({
          status: false,
          err: response,
        });
      }
      res.json({
        status: true,
        message: "Proceso Completado.",
      });
    });
  }
});

//Configuraciones de Google

module.exports = app;
