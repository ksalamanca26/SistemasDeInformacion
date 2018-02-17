const express= require('express');
const router= express.Router();
const path = require('path');
const passport = require('passport');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const sequelize= require('sequelize');
var connection= new sequelize('taller', 'root', 'password', {

	dialect : 'mysql',
	define : {

		freezeTableName : true,
		timestamps : false

	}

});

var Usuario = connection.import('../models/usuario');

router.get('/register', (req, res, next) => {
res.send('REGISTER');
	});

router.post('/register', (req, res, next) => {
const saltRounds=10;
const password=req.body.password;
console.log(password);

	bcrypt.hash(password, saltRounds, function(err, hash) {
	try{
	Usuario.create({

	nombre : req.body.nombre,
	apellido : req.body.apellido,
	email : req.body.email,
	contraseña : hash
	
	
	}).then(json => {

		res.json({success : true, msg : 'Usuario registrado'})
	});


}

catch(err){

	res.json({success : false, msg : 'Falla en el registro de usuario'})
}
});



});

router.get('/authenticate', (req, res, next) => {
res.send('AUTHENTICATE');
	});


router.post('/authenticate', (req, res, next) => {


try {

Usuario.findOne({

	where : {

		email : req.body.email
	}

}).then(usuario =>{

if(usuario!=undefined){
	console.log(req.body.password);
	console.log(usuario.dataValues.contraseña);

bcrypt.compare(req.body.password, usuario.dataValues.contraseña).then(function(val){


	if(val){
		res.json({success : true, 
			user : {

				nombre : usuario.dataValues.nombre,
				apellido : usuario.dataValues.apellido,
				email : usuario.dataValues.email
			}});
	}
	else{

	res.json({success : false, msg : "Contraseña incorrecta"});
	}

});


}

else{

	res.json({success : false, msg : "Usuario no existe"})
}

});

}

catch (err){

	res.json({success : false, msg : "Error en la busqueda"});
}


	});

router.get('/profile', (req, res, next) => {

	try{

Usuario.findOne().then(json => {


	console.log(json.dataValues);

})

	}

catch(err){

	console.log(err);
}


	});

router.get('/validate', (req, res, next) => {
res.send('VALIDATE');
	});



module.exports= router;