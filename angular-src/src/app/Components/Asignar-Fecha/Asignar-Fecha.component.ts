import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";

@Component({
  selector: 'app-Asignar-Fecha',
  templateUrl: './Asignar-Fecha.component.html',
  styleUrls: ['./Asignar-Fecha.component.css']
})
export class AsignarFechaComponent implements OnInit {

	citas : any[];
	selectedCita : any;
	cliente : any;
	vehiculo : any;
	fecha : Date;
	hora : String;

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {

  	this.authService.todasCitas().subscribe(data=>{
  		if(data){
  			this.citas=data;
  		}
  	});

  }

  onSelect(){

  	if(!this.validateService.validateDetallesCita(this.selectedCita)){
  		this.flashMessage.show("Por favor seleccione una cita", {cssClass : 'alert-danger', timeout : 3000})
  		return false;
  	}

  	const user = {
  		idUsuario : this.selectedCita.idUsuario
  	}

  	this.authService.buscarUsuario(user).subscribe(data=>{
  		if(data){
  			this.cliente=data;
  		}
  	});


  	const carro = {
  		idVehiculo : this.selectedCita.idVehiculo
  	}

  	this.authService.buscarVehiculo(carro).subscribe(data=>{
  		if(data){
  			this.vehiculo=data;
  		}
  	})

  }


  onSubmit(){

  	if(!this.validateService.validateDetallesCita(this.selectedCita)){
  		this.flashMessage.show("Por favor seleccione una cita", {cssClass : 'alert-danger', timeout : 3000})
  		return false;
  	}


  	const cita = {
  		idCita : this.selectedCita.idCita,
  		fecha : this.fecha,
  		hora : this.hora
  	}

  	this.authService.asignarFecha(cita).subscribe(data=>{
  		if(data.success){
  			this.flashMessage.show(data.msg, {cssClass : 'alert-success', timeout : 3000});
  			this.router.navigate(['dashboard-usuario']);
  		}

  		else{
  			this.flashMessage.show("Algo salió mal", {cssClass : 'alert-danger', timeout : 3000});
  			this.router.navigate(['dashboard-usuario']);
  		}
  	})

  }





}
