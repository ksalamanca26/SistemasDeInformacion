import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
@Component({
  selector: 'app-modificar-orden',
  templateUrl: './modificar-orden.component.html',
  styleUrls: ['./modificar-orden.component.css']
})
export class ModificarOrdenComponent implements OnInit {

	ordenes : any[];
	selectedOrden : any;
	columnas : any[];

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {

  	const user = {
  		id : this.authService.user.id
  	}

  	console.log(user);


  	this.columnas=['idOrden', 'Nombre Mecanico', 'Apellido Mecanico', 'Modelo Vehiculo', 'Placa', 'Serial del Motor'];

  	this.authService.ordenesMecanico(user).subscribe(data =>{
  		if(data){
  			this.ordenes = data[0];
  		}
  	})

  }


  onClick(orden){
  	this.selectedOrden = orden;
  }


  onSubmit(){

  	if(!this.validateService.validateUpdateOrden(this.selectedOrden)){
  		toast("Por favor rellene todos los campos", 3000);
  		return false;
  	}


  	const orden = {
  		idOrden : this.selectedOrden.idOrden,
  		herramientas : this.selectedOrden.Herramientas,
  		accesorios : this.selectedOrden.Accesorios,
  		llaves : this.selectedOrden.Llaves,
  		gato : this.selectedOrden.Gato,
  		caucho : this.selectedOrden.Caucho,
  		desperfectos : this.selectedOrden.Desperfectos
  	}


  	this.authService.updateOrden(orden).subscribe(data =>{
  		if(data.success){
  			toast(data.msg, 3000);
  			this.router.navigate(['dashboard-mecanico']);
  		}

  		else{

  			toast("Algo salió mal", 3000);
  			this.router.navigate(['dashboard-mecanico']);
  		}
  	})

  }

}
