import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
@Component({
  selector: 'app-solicitar-cita',
  templateUrl: './solicitar-cita.component.html',
  styleUrls: ['./solicitar-cita.component.css']
})
export class SolicitarCitaComponent implements OnInit {

	vehiculos : any[];
	idVehiculo : number;


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
  	idVehiculo : this.idVehiculo,
  	idUsuario : this.authService.user.id
  }

  	if(!this.validateService.validateRegisterC(cita)){
      toast("Por favor rellene todos los campos", 3000);
  		return false;
  	}

  	this.authService.registerCita(cita).subscribe(data =>{

  		if(data.success){
        toast("Cita solicitada", 3000);
  			this.router.navigate(['dashboard']);
  		}

  		else{
        toast("Algo salió mal", 3000);
  			this.router.navigate(['dashboard']);
  		}

  	})

  }

}
