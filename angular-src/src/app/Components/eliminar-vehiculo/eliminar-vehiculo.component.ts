import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";

@Component({
  selector: 'app-eliminar-vehiculo',
  templateUrl: './eliminar-vehiculo.component.html',
  styleUrls: ['./eliminar-vehiculo.component.css']
})
export class EliminarVehiculoComponent implements OnInit {
	vehiculos  : any[];
	idVehiculo: any;

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


  onDeleteSubmit(){

  	const vehiculo = {
  		idVehiculo : this.idVehiculo
  	}

  	if(!this.validateService.validateDeleteV(this.idVehiculo)){
  		this.flashMessage.show("Por favor seleccione el vehículo que desea eliminar", {cssClass : 'alert-danger', timeout : 3000});
  		return false;
  	}

  	this.authService.deleteVehiculo(vehiculo).subscribe(data =>{

  		if(data.success){
  			this.flashMessage.show(data.msg, {cssClass : 'alert-success', timeout : 3000})
  			this.router.navigate(['dashboard-usuario']);
  		}

  		else{
  			this.flashMessage.show(data.msg, {cssClass : 'alert-danger', timeout : 3000})
  			this.router.navigate(['dashboard-usuario']);
  		}

  	})


  }




}
