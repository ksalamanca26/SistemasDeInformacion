import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";

@Component({
  selector: 'app-registro-usuario',
  templateUrl: './registro-usuario.component.html',
  styleUrls: ['./registro-usuario.component.css']
})
export class RegistroUsuarioComponent implements OnInit {

nombre : String; 
apellido : String;
password : String;
email : String;

  constructor(private validateService : ValidateService, 
  	private flashMessage : FlashMessagesService,
  	private authService : AuthService,
  	private router : Router) { }

  ngOnInit() {
  }

  onRegisterSubmit(){

 	const user = {

 		nombre : this.nombre,
 		apellido : this.apellido,
 		password : this.password,
 		email : this.email,
    rol : 1
 	}

 	  if(!this.validateService.validateRegister(user)){
 	  	this.flashMessage.show("Por favor rellene todos los campos", {cssClass : 'alert-danger', timeout : 3000});
 	  	return false;
 	  }

 	  if(!this.validateService.validateEmail(user.email)){
 	  	this.flashMessage.show("Por favor ingrese un email válido", {cssClass : 'alert-danger', timeout : 3000});
 	  	return false;
 	  }


 	  this.authService.registerUser(user).subscribe(data => {
 	  	if(data.success){
 	  		this.flashMessage.show("Usuario registrado", {cssClass : 'alert-success', timeout : 3000});
 	  		this.router.navigate(['/iniciar-sesion']);
 	  	}
 	  	else{

 	  	this.flashMessage.show("Algo salió mal", {cssClass : 'alert-success', timeout : 3000});
 	  		this.router.navigate(['/inicio']);	
 	  	}

 	  });


}
  }


