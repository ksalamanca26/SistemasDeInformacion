import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";

@Component({
  selector: 'app-finalizar-orden',
  templateUrl: './finalizar-orden.component.html',
  styleUrls: ['./finalizar-orden.component.css']
})
export class FinalizarOrdenComponent implements OnInit {


	ordenes : any[];
	selectedOrden : any;

	columnas : any[];

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {

  	this.authService.todasOrdenes().subscribe(data=>{
  		if(data){
  			this.ordenes=data[0];
  			console.log(this.ordenes);
  			this.columnas=['idOrden', 'Estado', 'Nombre Mecanico', 'Apellido Mecanico', 'Modelo Vehiculo', 'Placa', 'Serial del Motor'];

  		}
  	})
  }


  onClick(orden){
  	if(orden.Estado == "Cerrada"){
  		toast("Esta orden ya ha sido finalizada", 3000);
  		return false;
  	}
  	else{
  		this.selectedOrden=orden;
  	}
  	
  }

  onSubmit(){

  	const orden = {
  		estado : "Cerrada",
  		idOrden : this.selectedOrden.idOrden
  	}

  	const cita = {
  		estado : "Finalizada",
  		idCita : this.selectedOrden.idCita
  	}
this.authService.updateCitaOrden(cita).subscribe(data=>{
  		if(!data.success){
  			toast("Algo salió mal", 3000);
  			this.router.navigate(['dashboard-gerente']);
  			return false;
  		}
  	})


  this.authService.cerrarOrden(orden).subscribe(data=>{
  		if(data.success){
  			toast(data.msg, 3000);
  			this.router.navigate(['dashboard-gerente']);
  		}

  		else{
  			toast("Algo salió mal", 3000);
  			this.router.navigate(['dashboard-gerente']);
  			
  		}
  	})



  }

}
