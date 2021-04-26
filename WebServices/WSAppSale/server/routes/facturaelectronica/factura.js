const express = require("express");
//var db = require('../../sql/usuarioSQL');
const app = express();

app.get("/Api/v1/facturaelectronica/factura", (req, res) => {
  // let Query = 'SI_User';
  //  let body = req.body;
  console.log(req.body);

  /*  executeSql(Query,params,'RegisterUser',(hashResponse,err)=>{
        if (err) {
            return res.status(500).json({
                status: false,
                err:{}
            });
        };
        res.json({
            status: true,
            mensaje:hashResponse.hashResponse
        });
    }); */
  res.json({
    status: true,
    mensaje: req.body.lista,
  });
});

//Configuraciones de Google

module.exports = app;
