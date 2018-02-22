import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
@Component({
  selector: 'app-solicitar-cita',
  templateUrl: './solicitar-cita.component.html',
  styleUrls: ['./solicitar-cita.component.css']
})
export class SolicitarCitaComponent implements OnInit {

	vehiculos : any[];
	idVehiculo : number;

	fecha : Date;
	hora : String;

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {
  	this.authService.loadUserData()
  	const user=this.authService.user;
  	this.authService.buscarVehiculos(user).subscribe(data =>{

  		if(data!=undefined){
  			console.log(data);
  			this.vehiculos=data;
  		}

  	});

  }

  onRegisterSubmit(){

  	const cita = {

  	fecha : this.fecha,
  	hora : this.hora,
  	idVehiculo : this.idVehiculo,
  	idUsuario : this.authService.user.id
  }

  	if(!this.validateService.validateRegisterC(cita)){
  		this.flashMessage.show("Por favor rellene todos los campos", {cssClass : 'alert-danger', timeout : 3000});
  		return false;
  	}

  	this.authService.registerCita(cita).subscribe(data =>{

  		if(data.success){
  			this.flashMessage.show("Cita solicitada", {cssClass : 'alert-success', timeout : 5000});
  			this.router.navigate(['dashboard']);
  		}

  		else{
  			this.flashMessage.show("Algo salió mal", {cssClass : 'alert-danger', timeout : 5000});
  			this.router.navigate(['dashboard']);
  		}

  	})

  }

}
