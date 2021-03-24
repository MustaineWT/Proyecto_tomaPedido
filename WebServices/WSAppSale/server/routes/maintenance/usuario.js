const express = require('express');
var db = require('../../sql/maintenanceSQL/usuarioSQL');
const bcrypt = require('bcrypt')
const app = express();
const {
    verificaToken
} = require('../../middlewares/autenticacion');

app.post('/Api/v1/UserAdmin', (req, res) => {
    let Query = 'SI_UserAdmin';
    let body = req.body;

    async function hashPassword(password) {
        const salt = await bcrypt.genSalt(10)
        const hash = await bcrypt.hash(password, salt)

        params = {
            BussinesName: body.BussinesName,
            Ruc: body.Ruc,
            Direction: body.Direction,
            City: body.City,
            Country: body.Country,
            Phone: body.Phone,
            EmailCompany: body.EmailCompany,
            Name: body.Name,
            LastName: body.LastName,
            Dni: body.Dni,
            TypePersonId: body.TypePersonId,
            EmailAdmin: body.EmailAdmin,
            DirectionAdmin: body.DirectionAdmin,
            CityAdmin: body.CityAdmin,
            CountryAdmin: body.CountryAdmin,
            User_at: body.User,
            Hash_at: hash
        };

        db.executeSql(Query, params, 'RegisterUserAdmin', (hashResponse, err) => {
            if (err) {
                return res.status(500).json({
                    status: false,
                    message: err
                });
            };
            if (hashResponse[0]['Response'] == 'Compania ya Existe' || hashResponse[0]['Response'] == 'Usuario ya Existe') {
                console.log(hashResponse[0]['Response']);
                return res.json({
                    status: false,
                    message: hashResponse[0]['Response']
                });
            }

            res.json({
                status: true,
                message: hashResponse[0].Response
            });
        });
    }

    hashPassword(body.Password);

});


app.get('/Api/v1/User', verificaToken, (req, res) => {
    let Query = 'SS_User';
    let body = req.query;
    if (body.personid == undefined) {
        return res.json({
            ok: false,
            message: 'Debe ingresar los parametros correctos.'
        });
    } else {
        params = {
            personid: body.personid
        };

        db.executeSql(Query, params, 'SelectUser', (user, err) => {

            if (err) {
                return res.status(500).json({
                    ok: false,
                    err: {}
                });
            };
            if (user.length > 0) {
                res.json({
                    ok: true,
                    user: user[0],
                    message: 'Solicitud Exitosa.',
                });
            } else {
                res.json({
                    ok: true,
                    message: 'No se encontraron registros para la consulta realizada.'
                });
            }


        });
    }

});

app.post('/Api/v1/UserSeller', (req, res) => {
    let Query = 'SI_UserSeller';
    let body = req.body;

    async function hashPassword(password) {
        const salt = await bcrypt.genSalt(10)
        const hash = await bcrypt.hash(password, salt)
        params = {
            Name: body.Name,
            LastName: body.LastName,
            Direction: body.Direction,
            City: body.City,
            Country: body.Country,
            Dni: body.Dni,
            Phone: body.Phone,
            Email: body.Email,
            TypePersonId: body.TypePersonId,
            User_at: body.User,
            Hash_at: hash
        };

        db.executeSql(Query, params, 'RegisterUserSeller', (hashResponse, err) => {
            if (err) {
                return res.status(500).json({
                    status: false,
                    response: err.message
                });
            };
            res.json({
                status: true,
                response: hashResponse[0].Response
            });
        });
    }

    hashPassword(body.Password);

});

//Configuraciones de Google

module.exports = app;