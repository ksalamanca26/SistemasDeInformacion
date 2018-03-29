import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";

@Component({
  selector: 'app-generacion-orden',
  templateUrl: './generacion-orden.component.html',
  styleUrls: ['./generacion-orden.component.css']
})
export class GeneracionOrdenComponent implements OnInit {

	citas : any[];
	selectedCita : any;
	cliente : any;
	vehiculo : any;
  foto : any;

	

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {
  	this.authService.todasCitas().subscribe(data=>{
  		if(data!=undefined){
  			this.citas=data;
  		}
  	});

  }


  onSelect(){

  	if(!this.validateService.validateDetallesCita(this.selectedCita)){
  		this.flashMessage.show("Por favor seleccione una cita",{cssClass : 'alert-danger', timeout : 3000})
  		return false;
  	}

  	const user= {
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
  	});

  }


  cargar(){

    console.log(this.foto);
    this.authService.cargar(this.foto).subscribe(data=>{
      if(data.success){
        this.flashMessage.show("Se cargó la foto", {cssClass : 'alert-success', timeout : 3000});
      }

      else{
        this.flashMessage.show("No se cargó", {cssClass : 'alert-danger', timeout : 3000});
      }

    })
  }





}
