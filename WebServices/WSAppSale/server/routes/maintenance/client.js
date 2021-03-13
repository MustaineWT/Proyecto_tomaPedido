const express = require('express');
var db = require('../../sql/maintenanceSQL/clientSQL');
const {
        verificaToken
} = require('../../middlewares/autenticacion');
const app = express();


app.get('/Api/v1/client', verificaToken, (req, res) => {
        const query = `SS_Client`;
        let body = req.query;
        if (body.companyid == undefined || body.branchofficeid == undefined) {
                return res.json({
                        ok: false,
                        message: 'Debe ingresar los parametros correctos.'
                });
        } else {
                params = {
                        companyid: body.companyid,
                        branchofficeid: body.branchofficeid
                };

                db.executeSql(query, params, 'ListClient', (listclient, err) => {

                        if (err) {
                                return res.status(500).json({
                                        ok: false,
                                        err: {}
                                });
                        };
                        if (listclient.length > 0) {
                                res.json({
                                        ok: true,
                                        listclient,
                                });
                        } else {
                                res.json({
                                        ok: true,
                                        response: 'No se encontraron registros para la consulta realizada.'
                                });
                        }


                });
        }

});
app.post('/Api/v1/client', verificaToken, (req, res) => {
        const query = `SI_Client`;
        let body = req.body;
        console.log(body);
        if (body.companyid == undefined || body.branchofficeid == undefined || 
                body.ruc == undefined || body.bussinesname == undefined ||
                body.email == undefined ||
                body.phone == undefined ||
                body.direction == undefined ||
                body.directionfiscal == undefined ||
                body.modulo == undefined ||
                body.order_at == undefined || body.latitude == undefined ||
                body.longitude == undefined || body.distance == undefined ||
                body.subgiro == undefined || body.giro == undefined ||
                body.listprice == undefined || body.perceptionflag == undefined) {
                return res.json({
                        ok: false,
                        response: 'Debe ingresar todos los parametros.'
                });
        } else {
                params = {
                        companyid: body.companyid,
                        branchofficeid: body.branchofficeid,
                        ruc: body.ruc,
                        bussinesname: body.bussinesname,
                        email: body.email,
                        phone: body.phone,
                        direction: body.direction,
                        directionfiscal: body.directionfiscal,
                        modulo: body.modulo,
                        order_at: body.order_at,
                        latitude: body.latitude,
                        longitude: body.longitude,
                        distance: body.distance,
                        subgiro: body.subgiro,
                        giro: body.giro,
                        listprice: body.listprice,
                        perceptionflag: body.perceptionflag
                };
                db.executeSql(query, params, 'ClientInsert', (response, err) => {
                        if (err) {
                                return res.status(500).json({
                                        ok: false,
                                        err: err
                                });
                        };
                        if (response[0]['Response'] === 'Codigo ya se encuentra registrado') {
                                return res.status(400).json({
                                        ok: false,
                                        response: response[0].Response
                                });
                        }
                        res.json({
                                ok: true,
                                Response: response[0].Response
                        });
                });
        }
});
app.put('/Api/v1/client', verificaToken, (req, res) => {
        const query = `SU_Client`;
        let body = req.body;
        if (body.companyId == undefined || body.branchofficeid == undefined ||
                body.ruc == undefined || body.bussinesname == undefined ||
                body.email == undefined || body.direction == undefined ||
                body.directionfiscal == undefined || body.modulo == undefined ||
                body.order_at == undefined || body.latitude == undefined ||
                body.longitude == undefined || body.distance == undefined ||
                body.subgiro == undefined || body.giro == undefined ||
                body.listprice == undefined || body.perceptionflag) {
                return res.json({
                        ok: false,
                        response: 'Debe ingresar todos los parametros.'
                });
        } else {
                params = {
                        companyid: body.companyId,
                        branchofficeId: body.branchofficeid,
                        ruc: body.ruc,
                        bussinesname: body.bussinesname,
                        email: body.email,
                        phone: body.phone,
                        direction: body.direction,
                        directionfiscal: body.directionfiscal,
                        modulo: body.modulo,
                        order_at: body.order_at,
                        latitude: body.latitude,
                        longitude: body.longitude,
                        distance: body.distance,
                        subgiro: body.subgiro,
                        giro: body.giro,
                        listprice: body.listprice,
                        perceptionflag: perceptionflag
                };
                console.log(params);
                db.executeSql(query, params, 'ClientUpdate', (contacto, err) => {
                        if (err) {
                                return res.status(500).json({
                                        ok: false,
                                        err: err.message
                                });
                        };
                        res.json({
                                ok: true,
                                response: contacto.Response
                        });
                });
        }
});
app.delete('/Api/v1/client', verificaToken, (req, res) => {
        const query = `SD_Client`;
        let body = req.body;
        if (body.id == undefined || body.userdeleted_at == undefined) {
                return res.json({
                        ok: false,
                        message: 'Debe ingresar todos los parametros.'
                });
        } else {
                params = {
                        clientid: body.clientid
                };
                db.executeSql(query, params, 'ClientDelete', (response, err) => {
                        if (err) {
                                return res.status(500).json({
                                        ok: false,
                                        err: err.message
                                });
                        };
                        res.json({
                                ok: true,
                                response: response.Response
                        });
                });
        }


});

module.exports = app;