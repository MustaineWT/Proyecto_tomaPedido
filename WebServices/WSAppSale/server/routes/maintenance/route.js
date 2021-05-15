const express = require("express");
var db = require("../../sql/maintenanceSQL/routeSQL");
const app = express();
const { verificaToken } = require("../../middlewares/autenticacion");

app.post("/Api/v1/Route", verificaToken, (req, res) => {
  const query = `SI_Route`;
  let body = req.body;
  if (
    body.CompanyId == undefined ||
    body.BranchOfficeId == undefined ||
    body.Route == undefined ||
    body.Description == undefined ||
    body.Zone == undefined ||
    body.Mo == undefined ||
    body.Tu == undefined ||
    body.We == undefined ||
    body.Th == undefined ||
    body.Fr == undefined ||
    body.Sa == undefined ||
    body.Su == undefined ||
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
      route: body.Route,
      description: body.Description,
      zone: body.Zone,
      mo: body.Mo,
      tu: body.Tu,
      we: body.We,
      th: body.Th,
      fr: body.Fr,
      sa: body.Sa,
      su: body.Su,
      ffvv: body.Ffvv,
    };
    db.executeSql(query, params, "RouteInsert", (response, err) => {
      if (err) {
        return res.status(500).json({
          status: false,
          err: err,
        });
      }
      if (response[0]["Response"] === "Route is Exists") {
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

app.get("/Api/v1/Route", verificaToken, (req, res) => {
  const query = "SS_Route";
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

    db.executeSql(query, params, "SelectRoute", (route, err) => {
      if (err) {
        return res.status(500).json({
          status: false,
          err: {},
        });
      }
      if (route.length > 0) {
        res.json({
          status: true,
          route: route,
          message: "Solicitud Exitosa.",
        });
      } else {
        res.json({
          status: false,
          message: "No se encontraron registros para la consulta realizada.",
        });
      }
    });
  }
});

//Configuraciones de Google

module.exports = app;
