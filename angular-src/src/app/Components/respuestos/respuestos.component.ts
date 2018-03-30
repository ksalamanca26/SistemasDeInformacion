import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
@Component({
  selector: 'app-respuestos',
  templateUrl: './respuestos.component.html',
  styleUrls: ['./respuestos.component.css']
})
export class RespuestosComponent implements OnInit {

	repuestos : any[];
	selectedRepuesto : any;
	nuevo : boolean;
	columnas : any[];

	nombre : String;
	serial : String;
	cantidad : Number;
	tipo : String;


  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router,) { }

  ngOnInit() {

  		this.authService.todosRepuestos().subscribe(data =>{
  			if(data){
  				this.repuestos=data;
  				this.columnas= ["Nombre", "Serial", "Cantidad", "Tipo"];
  				this.nuevo=false;
  			}
  		})
  }


  onClick(repuesto){
  	this.selectedRepuesto=repuesto;
  	this.nuevo=false;
  }

  onNuevo(){
  	this.nuevo=true;
  }


  onUpdate(){

  if(!this.validateService.validateUpdateRepuesto(this.selectedRepuesto)){
  	toast("Por favor rellene todos los campos", 3000);
  	return false;
  }

  	this.authService.updateRepuesto(this.selectedRepuesto).subscribe(data =>{
  		if(data.success){
  			toast(data.msg, 3000);
  			this.router.navigate(['dashboard-usuario']);
  		}

  		else{
  			toast("Algo salió mal", 3000);
  			this.router.navigate(['dashboard-usuario']);
  		}
  	})


  }


  onSubmit(){

  	const repuesto = {
  		Nombre : this.nombre,
  		Serial : this.serial,
  		Cantidad : this.cantidad,
  		Tipo : this.tipo
  	}

 	if(!this.validateService.validateDetallesRepuesto(repuesto)){
 		toast("Por favor rellene todos los campos", 3000);
 		return false;
 	}

 	this.authService.registerRepuesto(repuesto).subscribe(data =>{
 		if(data.success){
 			toast(data.msg, 3000);
 			this.router.navigate(['dashboard-usuario']);
 		}


 		else{
 			toast("Algo salió mal", 3000);
 			this.router.navigate(['dashboard-usuario']);
 		}

 	})

  }

}
