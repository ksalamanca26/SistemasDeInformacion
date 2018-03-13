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
var Vehiculo = connection.import('../models/vehiculo');
var Cita = connection.import('../models/cita');

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

	Nombre : req.body.nombre,
	Apellido : req.body.apellido,
	Email : req.body.email,
	Contraseña : hash,
	Rol : req.body.rol
	
	
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

		Email : req.body.email
	}

}).then(usuario =>{

if(usuario!=undefined){
	console.log(req.body.password);
	console.log(usuario.dataValues.Contraseña);

bcrypt.compare(req.body.password, usuario.dataValues.Contraseña).then(function(val){


	if(val){
		res.json({success : true, 
			user : {
				id : usuario.dataValues.idUsuario,
				nombre : usuario.dataValues.Nombre,
				apellido : usuario.dataValues.Apellido,
				email : usuario.dataValues.Email,
				rol : usuario.dataValues.Rol
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


router.post('/registrar-v', (req, res, next) =>{
try{
	Vehiculo.create({

	Serial : req.body.serial,
	fechaRegistro : req.body.fecha,
	Placa : req.body.placa,
	Year : req.body.year,
	Modelo : req.body.modelo,
	Estado : "Activo",
	idUsuario : req.body.idUsuario
	
	
	}).then(json => {

		res.json({success : true, msg : 'Vehiculo registrado'})
	});


}

catch(err){

	res.json({success : false, msg : 'Falla en el registro de vehiculo'})
}

});


router.post('/buscar-vehiculos', (req, res, next) =>{

	try{
	Vehiculo.findAll({

		where : {
			idUsuario : req.body.id
		}

	}).then(json =>{

		if(json!=undefined){
			res.send(json);
		}
		
		else{
			res.json({success : false, msg : 'Esta undefined'})
		}


	})	
	}

	catch (err){

		res.json({success : false, msg : 'Falla en busqueda de vehiculo'})
	}
	

  });


router.post('/registrar-c', (req, res, next) => {
	try{
	Cita.create({
	Hora : req.body.hora,
	fechaSolicitud : req.body.fecha,
	Estado : "Solicitada",
	idVehiculo : req.body.idVehiculo,
	idUsuario : req.body.idUsuario,
	
	
	}).then(json => {

		res.json({success : true, msg : 'Cita solicitada'})
	});


}

catch(err){

	res.json({success : false, msg : 'Falla en el registro'})
}




});


router.post('/eliminar-v', (req, res, next) => {

try{

Vehiculo.destroy({

	where : {
		idVehiculo : req.body.idVehiculo
	}

}).then(json =>{

	res.json({success : true, msg : "Vehiculo eliminado"})
})


}

catch(err){
	res.json({success : false, msg: "Falla en la eliminacion"})
}

	 });

router.get('/todos-usuarios', (req, res, next) =>{

	try{

		Usuario.findAll().then(json =>{

			if(json!=undefined){
				res.send(json)
			}

			else{
				res.json({success : false, msg : "Esta undefined"})
			}

		})

	}

	catch(err){
		res.json({success : false, msg : "Error en el query"})
	}

});


router.post('/update-r', (req, res, next) =>{

	try{
		Usuario.update(
			{Rol : req.body.rol},
			{where : {
				idUsuario : req.body.idUsuario
			}}
			).then(json =>{

				res.json({success : true, msg : "Usuario actualizado"})

			})
	}

	catch(err){


		res.json({success : false, msg : "Error en el query"})
	}


});

router.post('/buscar-c', (req, res, next) =>{


	try{

		Cita.findAll({
			where : {
				idUsuario : req.body.id
			}
		}).then(json =>{
			if(json!=undefined){
			res.send(json)	
			}

			else{
				res.json({success : false, msg : "Esta undefined"})
			}
			

		})

	}


	catch(err){

		res.json({success : false, msg : "Error en el query"});
	}


});

router.post('/eliminar-c', (req, res, next) =>{


try{

Cita.destroy({
	where : {
		idCita : req.body.idCita
	}
}).then(json =>{

	res.json({success : true, msg : "Cita cancelada"});
})

}

catch(err){

	res.json({success : false, msg : "Error en el query"});

}

});


router.get('/todas-citas', (req, res, next) =>{

try{

	Cita.findAll({
		where : {
			Estado : "Solicitada"
		}
	}).then(json =>{

		res.send(json);
	})

}


catch(err){

	res.json({success : false, msg : "Error en el query"});

}


});


router.post('/buscar-u', (req, res, next) =>{


	try{

		Usuario.findOne({
			where : {
				idUsuario : req.body.idUsuario
			}
		}).then(json =>{
			res.send(json);
		})

	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
		 }
	

});


router.post('/buscar-v', (req, res, next) =>{
	try{
		Vehiculo.findOne({
			where : {
				idVehiculo : req.body.idVehiculo
			}
		}).then(json=>{
			res.send(json);
		})
	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}
});


router.post('/update-c', (req, res, next) =>{

	try{
	Cita.update({
		fechaAsignada : req.body.fecha,
		Hora : req.body.hora,
		Estado : "Asignada"},

		{where : {
			idCita : req.body.idCita
		}
	}).then(json=>{
		res.json({success :true, msg : "Fecha asignada"});
	})	
	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}
	

});



router.post('/update-v',(req, res, next) =>{


	try{

		Vehiculo.update({
			Serial : req.body.serial,
			Placa : req.body.placa,
			Modelo : req.body.modelo,
			Year : req.body.year,
			Estado : req.body.estado
		},
		{where :{
			idVehiculo : req.body.idVehiculo
		}}).then(json=>{
			res.json({success : true, msg : "Vehiculo modificado"});
		})

	}


	catch(err){

		res.json({success : false, msg : "Error en el query"});
	}


});

router.post('/update-u', (req, res, next) =>{

	try{
	Usuario.update({
		Nombre : req.body.nombre,
		Apellido : req.body.apellido,
		Email : req.body.email
	},
	{where : {
		idUsuario : req.body.idUsuario
	}}).then(json=>{
		res.json({success : true, msg : "Usuario modificado"});
	})	
	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}
	
});



module.exports= router;