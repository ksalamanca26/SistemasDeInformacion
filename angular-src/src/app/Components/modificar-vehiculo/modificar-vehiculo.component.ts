import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";

@Component({
  selector: 'app-modificar-vehiculo',
  templateUrl: './modificar-vehiculo.component.html',
  styleUrls: ['./modificar-vehiculo.component.css']
})
export class ModificarVehiculoComponent implements OnInit {


	vehiculos : any[];
	selectedVehiculo : any;

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {
  	this.authService.loadUserData();
  	const user = this.authService.user;
  	this.authService.buscarVehiculos(user).subscribe(data=>{
  		if(data){
  			this.vehiculos=data
  		}
  	});
  }


  onActivarDesactivar(){

  	console.log(this.selectedVehiculo.Estado)
  	if(this.selectedVehiculo.Estado=="Activo"){
  		this.selectedVehiculo.Estado="Desactivado";
  	}

  	else if(this.selectedVehiculo.Estado=="Desactivado"){
  		this.selectedVehiculo.Estado="Activo";
  	}

  }



  onSubmit(){

  	const carro = {
  		idVehiculo : this.selectedVehiculo.idVehiculo,
  		serial : this.selectedVehiculo.Serial,
  		modelo : this.selectedVehiculo.Modelo,
  		year : this.selectedVehiculo.Year,
  		placa : this.selectedVehiculo.Placa,
  		estado : this.selectedVehiculo.Estado,
  		fecha : this.selectedVehiculo.fechaRegistro
  	}


  	if(!this.validateService.validateRegisterV(carro)){
  		this.flashMessage.show("Por favor rellene todos los campos",{cssClass : 'alert-danger', timeout : 3000})
  		return false;
  	}


  	this.authService.updateVehiculo(carro).subscribe(data=>{
  		if(data.success){
  			this.flashMessage.show(data.msg,{cssClass : 'alert-success', timeout : 3000})
  			this.router.navigate(['dashboard']);
  		}

  		else{
  			this.flashMessage.show("Algo salió mal", {cssClass : 'alert-danger', timeout : 3000})
  			this.router.navigate(['dashboard']);
  		}
  	})

  }

}
