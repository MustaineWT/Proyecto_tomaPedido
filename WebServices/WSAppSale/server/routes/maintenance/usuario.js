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
    console.log(body);
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


app.post('/Api/v1/UserSeller', verificaToken, (req, res) => {
    let Query = 'SI_UserSeller';
    let body = req.body;
    console.log(req.body);
    async function hashPassword(password) {
        const salt = await bcrypt.genSalt(10)
        const hash = await bcrypt.hash(password, salt)
        params = {
            CompanyId: body.CompanyId,
            BranchOfficeId: body.BranchOfficeId,
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
                    message: err.message
                });
            };
            console.log(hashResponse);
            res.json({
                status: true,
                personid: hashResponse[0].PersonId,
                message: hashResponse[0].Response
            });
        });
    }

    hashPassword(body.Password);

});


app.get('/Api/v1/User', verificaToken, (req, res) => {
    const query = 'SS_User';
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

        db.executeSql(query, params, 'SelectUser', (user, err) => {

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

app.get('/Api/v1/UserSeller', verificaToken, (req, res) => {
    const query = 'SS_Seller';
    let body = req.query;
    if (body.CompanyId == undefined || body.BranchOfficeId == undefined) {
        return res.json({
            ok: false,
            message: 'Debe ingresar los parametros correctos.'
        });
    } else {
        params = {
            CompanyId: body.CompanyId,
            BranchOfficeId: body.BranchOfficeId
        };

        db.executeSql(query, params, 'SelectUserSeller', (seller, err) => {

            if (err) {
                return res.status(500).json({
                    ok: false,
                    err: {}
                });
            };
            if (seller.length > 0) {
                res.json({
                    ok: true,
                    seller: seller,
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

//Configuraciones de Google

module.exports = app;