const express= require('express');
const router= express.Router();
const path = require('path');
const fs =require('fs');
const nodemailer= require('nodemailer');
const bcrypt = require('bcryptjs');
const sequelize= require('sequelize');
var connection;

if(process.env.JAWSDB_URL){
connection = new sequelize(process.env.JAWSDB_URL, {

  dialect : 'mysql',

  define : {

     freezeTableName : true,
     timestamps : false
  }

});
}

else{
connection = new sequelize("taller", "root", "password", {

  dialect : 'mysql',

  define : {

     freezeTableName : true,
     timestamps : false
  }

})	
}




var transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'mecametca@gmail.com',
    pass: 'mecamet123'
  }
});

var Usuario = connection.import('../models/usuario');
var Vehiculo = connection.import('../models/vehiculo');
var Cita = connection.import('../models/cita');
var Repuesto = connection.import('../models/repuesto');
var Orden = connection.import('../models/orden');

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

router.post('/todos-rol', (req, res, next) =>{

	try{

		Usuario.findAll({
			where : {
				Rol : req.body.rol
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

		connection.query("select cita.*, vehiculo.Modelo, vehiculo.Placa, cita.Estado as 'Estado Cita' from cita inner join usuario on cita.idUsuario = usuario.idUsuario inner join vehiculo on cita.idVehiculo = vehiculo.idVehiculo where cita.idUsuario="+req.body.id).then(json =>{
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

	connection.query("select cita.*, usuario.Nombre, usuario.Apellido, usuario.Email, vehiculo.Modelo, vehiculo.Placa, vehiculo.Year as Año, vehiculo.Estado as 'Estado Vehiculo' from cita inner join usuario on cita.idUsuario = usuario.idUsuario inner join vehiculo on vehiculo.idVehiculo = cita.idVehiculo where cita.Estado = 'Solicitada';")
	.then(json =>{
		res.send(json);
	}

)}


catch(err){

	res.json({success : false, msg : "Error en el query"});

}


});


router.get('/asignadas-citas', (req, res, next) =>{

try{

	connection.query("select cita.idCita, cita.Estado as 'Estado Cita', cita.idVehiculo, usuario.Nombre, usuario.Apellido, usuario.Email, vehiculo.Modelo, vehiculo.Placa, vehiculo.Year as Año, vehiculo.Estado as 'Estado Vehiculo' from cita inner join usuario on cita.idUsuario = usuario.idUsuario inner join vehiculo on vehiculo.idVehiculo = cita.idVehiculo where cita.Estado = 'Asignada';")
	.then(json =>{
		res.send(json);
	}

)}


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
		console.log(req.body.email);
			var mailOptions = {
  			from: 'mecametca@gmail.com',
  			to: req.body.email,
 			subject: 'Cita asignada',
  			html: '<h1>Estimado usuario,</h1> <div class="row">se le ha asignado una cita para el '+ req.body.fecha+' a las '+req.body.hora+' . </div>'
};

transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});
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



router.get('/todos-r', (req, res, next) =>{

	try{
	Repuesto.findAll().then(json=>{
		res.send(json);
	})	
	}

	
	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}


});


router.post('/update-rep', (req, res, next) =>{

	try{

		Repuesto.update({
			Nombre : req.body.Nombre,
			Serial : req.body.Serial,
			Cantidad : req.body.Cantidad,
			Tipo : req.body.Tipo
		},
		{where : {
			idRepuesto : req.body.idRepuesto
		}}).then(json=>{
			res.json({success : true, msg : "Repuesto actualizado"});
		})

	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}

});


router.post('/register-rep', (req, res, next) =>{


	try{
		Repuesto.create({
			Nombre : req.body.Nombre,
			Serial : req.body.Serial,
			Cantidad : req.body.Cantidad,
			Tipo : req.body.Tipo
		}).then(json =>{
			res.json({success : true, msg : "Repuesto registrado"});
		})
	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}

});

router.post('/register-o', (req, res, next) =>{


	try{
		Orden.create({
			Herramientas : req.body.herramientas,
			Accesorios : req.body.accesorios,
			Llaves : req.body.llaves,
			Desperfectos : req.body.carroceria,
			Gato : req.body.gato,
			Caucho : req.body.caucho,
			Estado : 'Abierta',
			Foto : req.body.foto,
			idUsuario : req.body.idUsuario,
			Vehiculo : req.body.idVehiculo,
			idCita : req.body.idCita
		}).then(json =>{
			res.json({success : true, msg : "Orden creada", idOrden : json.dataValues.idOrden});
		})
	}

	catch(err){	
		res.json({success : false, msg : "Error en el query"});
	}

});


router.post('/ordenes-m', (req, res, next) =>{


	try{
		connection.query("select orden.idOrden, orden.Estado, orden.Herramientas, orden.Accesorios, orden.Gato, orden.Caucho, orden.Desperfectos, orden.Llaves, orden.Estado as 'Estado Orden', usuario.Nombre as 'Nombre Mecanico', usuario.Apellido as 'Apellido Mecanico', vehiculo.Modelo as 'Modelo Vehiculo', vehiculo.Placa, vehiculo.Serial as 'Serial del Motor' from orden inner join usuario on orden.idUsuario = usuario.idUsuario inner join vehiculo on orden.Vehiculo = vehiculo.idVehiculo where orden.idUsuario = "+req.body.id)
		.then(json=>{
			res.send(json);
		})
	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}

});


router.post('/update-o', (req, res, next) =>{

	try{
		Orden.update({
			Herramientas : req.body.herramientas,
			Accesorios : req.body.accesorios,
			Llaves : req.body.llaves,
			Gato : req.body.gato,
			Caucho : req.body.caucho,
			Desperfectos : req.body.desperfectos
		},
		{where : {
			idOrden : req.body.idOrden
		}}).then(json =>{
			res.json({success : true, msg : "Orden actualizada"});
		})
	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}

});


router.post('/update-c2', (req, res, next) =>{

	try{
		Cita.update({
			Estado : req.body.estado
		}, {where : {
			idCita : req.body.idCita
		}}).then(json =>{
			res.json({success : true});
		})
	} 

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}

});

router.get('/todos-v', (req, res, next) =>{
	try{
		Vehiculo.findAll().then(json=>{
			res.send(json);
		})
	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}
});

router.get('/todas-o', (req, res, next) =>{
	try{
		connection.query("select orden.idOrden, orden.Herramientas, orden.Accesorios, orden.Gato, orden.Caucho, orden.Desperfectos, orden.Llaves, orden.Estado, orden.idCita, usuario.Nombre as 'Nombre Mecanico', usuario.Apellido as 'Apellido Mecanico', vehiculo.Modelo as 'Modelo Vehiculo', vehiculo.Placa, vehiculo.Serial as 'Serial del Motor' from orden inner join usuario on orden.idUsuario = usuario.idUsuario inner join vehiculo on orden.Vehiculo = vehiculo.idVehiculo")
		.then(json=>{
			res.send(json);
		})
	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}
});


router.post('/cerrar-o', (req, res, next) =>{
	try{
		Orden.update({
			Estado : req.body.estado
		}, {
			where : {
				idOrden : req.body.idOrden
			}
		}).then(json =>{
			res.json({success : true, msg : "Orden finalizada"});
		})
	}

	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}
});


router.post('/qr-orden', (req, res, next) =>{
	try{
		connection.query("select orden.idOrden, orden.Herramientas, orden.Accesorios, orden.Gato, orden.Caucho, orden.Desperfectos, orden.Llaves, orden.Estado as 'Estado Orden', orden.idCita, cita.Estado as 'Estado Cita', usuario.Nombre as 'Nombre Mecanico', usuario.Apellido as 'Apellido Mecanico', vehiculo.Modelo as 'Modelo Vehiculo', vehiculo.Placa, vehiculo.Serial as 'Serial del Motor' from orden inner join usuario on orden.idUsuario = usuario.idUsuario inner join vehiculo on orden.Vehiculo = vehiculo.idVehiculo inner join cita on orden.idCita = cita.idCita where orden.idOrden = "+req.body.idOrden)
		.then(json=>{
			res.send(json);
		})
	}


	catch(err){
		res.json({success : false, msg : "Error en el query"});
	}

});


router.post('/email-qr', (req, res, next) =>{


	try{

		var mailOptions = {
  			from: 'mecametca@gmail.com',
  			to: req.body.email,
 			subject: 'Vehículo admitido',
 			html : '<h1> Vehículo Admitido </h1> <div class ="row"> Estimado usuario, su vehículo ha sido admitido. Puede escanear el código QR adjunto para ver detalles del servicio </div> <br> <div class="row"> <img src="'+req.body.url+'"> </div>'
};

transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
    res.json({success : true, msg : "Orden creada"});
  }
});
	}


	catch(err){

	}


})




module.exports= router;