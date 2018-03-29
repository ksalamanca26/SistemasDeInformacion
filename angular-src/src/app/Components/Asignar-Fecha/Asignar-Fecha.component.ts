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
	fecha : Date;
	hora : String;

  columnas : any[];

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {

  	this.authService.todasCitas().subscribe(data=>{
  		if(data){
        console.log(data);
  			this.citas=data[0];
  		}
  	});

    this.columnas= ["Nombre", "Apellido", "Email", "Modelo", "Placa", "Año", "Estado Vehiculo"];

  }

  onClick(cita){
    this.selectedCita=cita;
    console.log(this.selectedCita);
  }


  onAsignarFecha(){

    console.log("Entré");

  	if(!this.validateService.validateDetallesCita(this.selectedCita)){
  		this.flashMessage.show("Por favor seleccione una cita", {cssClass : 'alert-danger', timeout : 3000})
  		return false;
  	}

    if(this.selectedCita.fechaAsignada == undefined || this.selectedCita.Hora == undefined){
      this.flashMessage.show("Por favor rellene todos los campos", {cssClass : 'alert-danger', timeout : 3000})
      return false;
    }


  	const cita = {
  		idCita : this.selectedCita.idCita,
  		fecha : this.selectedCita.fechaAsignada,
  		hora : this.selectedCita.Hora,
      email : this.selectedCita.Email
  	}
      	this.authService.asignarFecha(cita).subscribe(data=>{

  		if(data.success){
  			this.flashMessage.show(data.msg, {cssClass : 'alert-success', timeout : 3000});
  			this.router.navigate(['dashboard-gerente']);
  		}

  		else{
  			this.flashMessage.show("Algo salió mal", {cssClass : 'alert-danger', timeout : 3000});
  			this.router.navigate(['dashboard-gerente']);
  		}
  	})

  }





}
