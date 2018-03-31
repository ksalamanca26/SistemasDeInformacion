import { Injectable } from '@angular/core';

@Injectable()
export class ValidateService {

  constructor() { }

validateRegister(user){

if(user.nombre == undefined || user.apellido == undefined || user.email == undefined || user.password == undefined)
{

return false;

}

else{

	return true;
}
}

validateUpdateU(user){
	if(user.nombre == '' || user.apellido == '' || user.email == ''){
		return false;
	}
	else{
		return true;
	}
}

validateEmail(email){
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);

}

validateLogin(user){

	if(user.email == undefined || user.password == undefined){
		return false;
	}

	else{
		return true;
	}
}


validateRegisterV(vehiculo){


if(vehiculo.serial== undefined || vehiculo.modelo == undefined || vehiculo.fecha == undefined || vehiculo.placa == undefined || vehiculo.year == undefined)
{
	return false;
}

else{
	return true;
}


}

validateUpdateV(vehiculo){
	if(vehiculo.serial == '' || vehiculo.modelo == '' ||  vehiculo.placa == '' || vehiculo.year == ''){
		return false;
	}

	else{
		return true;
	}
}

validateRegisterC(cita){

if(cita.idVehiculo == undefined || cita.idUsuario == undefined)
{

return false;

}

else{

	return true;
}


}

validateDeleteV(idVehiculo){

	if(idVehiculo == undefined){
		return false;
	}
	else{
		return true;
	}
}


validateUpdateR(usuario){


	if(usuario.idUsuario == undefined || usuario.rol == undefined){
		return false;
	}

	else{
		return true;
	}

}


validateDeleteC(cita){

	if(cita==undefined){
		return false;
	}


	else{
		return true;
	}

}


validateDetallesCita(selectedCita){
	if(selectedCita==undefined){
		return false;
	}
	else{
		return true;
	}
}


validateDetallesRepuesto(repuesto){
	if(repuesto.Nombre == undefined || repuesto.Serial == undefined || repuesto.Cantidad == undefined || repuesto.Tipo == undefined){
		return false;
	}

	else{
		return true;
	}
}

validateUpdateRepuesto(repuesto){
	if(repuesto.Nombre == '' || repuesto.Serial == '' || repuesto.Cantidad == '' || repuesto.Tipo == ''){
		return false;
	}

	else{
		return true;
	}
}


validateRegisterOrden(orden){
	if(orden.herramientas == undefined || orden.llaves == undefined || orden.caucho == undefined || orden.accesorios == undefined || orden.gato == undefined || orden.sonido == undefined || orden.carroceria == undefined || orden.idVehiculo == undefined || orden.idUsuario == undefined)
	{
		return false;
	}

	else{
		return true;
	}
}

}
