import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
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
       toast("Por favor rellene todos los campos", 3000);
 	  	return false;
 	  }

 	  if(!this.validateService.validateEmail(user.email)){
       toast("Por favor ingrese un email válido", 3000);
 	  	return false;
 	  }


 	  this.authService.registerUser(user).subscribe(data => {
 	  	if(data.success){
         toast("Usuario registrado", 3000);
 	  		this.router.navigate(['/iniciar-sesion']);
 	  	}
 	  	else{
         toast("Algo salió mal", 3000);
 	  		this.router.navigate(['/inicio']);	
 	  	}

 	  });


}
  }


