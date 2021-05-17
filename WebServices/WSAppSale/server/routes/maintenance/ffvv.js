const express = require("express");
var db = require("../../sql/maintenanceSQL/ffvvSQL");
const app = express();
const { verificaToken } = require("../../middlewares/autenticacion");

app.post("/Api/v1/Ffvv", verificaToken, (req, res) => {
  const query = `SI_Ffvv`;
  let body = req.body;
  if (
    body.CompanyId == undefined ||
    body.BranchOfficeId == undefined ||
    body.Ffvv == undefined ||
    body.Description == undefined
  ) {
    return res.json({
      status: false,
      response: "Debe ingresar todos los parametros.",
    });
  } else {
    params = {
      companyid: body.CompanyId,
      branchofficeid: body.BranchOfficeId,
      ffvv: body.Ffvv,
      description: body.Description,
    };
    db.executeSql(query, params, "FfvvInsert", (response, err) => {
      if (err) {
        return res.status(500).json({
          status: false,
          err: err,
        });
      }
      if (response[0]["Response"] === "Ffvv ya Existe") {
        return res.status(400).json({
          status: false,
          message: "Ffvv ya existe.",
        });
      }
      res.json({
        status: true,
        message: "Proceso Completado.",
      });
    });
  }
});

app.get("/Api/v1/Ffvv", verificaToken, (req, res) => {
  const query = "SS_Ffvv";
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

    db.executeSql(query, params, "SelectFfvv", (ffvv, err) => {
      if (err) {
        return res.status(500).json({
          status: false,
          err: {},
        });
      }
      if (ffvv.length > 0) {
        res.json({
          status: true,
          ffvv: ffvv,
          message: "Solicitud Exitosa.",
        });
      } else {
        res.json({
          status: false,
          ffvv: [],
        });
      }
    });
  }
});

app.delete("/Api/v1/Ffvv", verificaToken, (req, res) => {
  const query = `SD_Ffvv`;
  let body = req.body;
  if (
    body.CompanyId == undefined ||
    body.BranchOfficeId == undefined ||
    body.Ffvv == undefined
  ) {
    return res.json({
      status: false,
      message: "Debe ingresar todos los parametros.",
    });
  } else {
    params = {
      companyid: body.CompanyId,
      branchofficeid: body.BranchOfficeId,
      ffvv: body.Ffvv,
    };
    db.executeSql(query, params, "FfvvDelete", (response, err) => {
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
