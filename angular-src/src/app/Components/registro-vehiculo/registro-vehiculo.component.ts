import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";

@Component({
  selector: 'app-registro-vehiculo',
  templateUrl: './registro-vehiculo.component.html',
  styleUrls: ['./registro-vehiculo.component.css']
})
export class RegistroVehiculoComponent implements OnInit {

	serial : String;
	modelo : String;
	fecha : Date;
	placa : String;
	year : number;


  constructor(private validateService : ValidateService,
  	private authService : AuthService,
  	private router : Router,
  	private flashMessage : FlashMessagesService
  	) { }

  ngOnInit() {
  }

  onRegisterSubmit(){


  	const user=JSON.parse(localStorage.getItem('user'));
 	

 	const vehiculo = {

 		serial : this.serial,
 		modelo : this.modelo,
 		fecha : this.fecha,
 		placa : this.placa,
 		year : this.year,
 		idUsuario : user.id
 	}


 	if(!this.validateService.validateRegisterV(vehiculo)){
  		this.flashMessage.show("Por favor rellene todos los campos", { cssClass : 'alert-danger', timeout : 3000 });
  		return false;
  	}

  	this.authService.registerVehiculo(vehiculo).subscribe(data=>{


  		if(data.success){
  			this.flashMessage.show(data.msg, { cssClass : 'alert-success', timeout : 3000 });
  			this.router.navigate(['/dashboard']);
  			
  		}

  		else{
  			this.flashMessage.show(data.msg, { cssClass : 'alert-danger', timeout : 3000 });
  			this.router.navigate(['/registro-vehiculo']);
  		}

  	})


  }

}
