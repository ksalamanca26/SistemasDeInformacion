import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
@Component({
  selector: 'app-registrar-adm',
  templateUrl: './registrar-adm.component.html',
  styleUrls: ['./registrar-adm.component.css']
})
export class RegistrarAdmComponent implements OnInit {

	nombre : String;
	apellido : String;
	email : String;
	password : String;
	rol : number;

  constructor(private validateService : ValidateService,
  	private authService : AuthService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {
  }


  onRegisterSubmit(){

  const user = {

  	nombre : this.nombre,
  	apellido : this.apellido,
  	email : this.email,
  	password : this.password,
  	rol : this.rol

  }

  	if(!this.validateService.validateRegister(user)){
      toast("Por favor rellene todos los campos", 3000);
  		return false;
  	}

  	if(!this.validateService.validateEmail(user.email)){
      toast("Por favor ingrese un email válido", 3000);
  		return false;
  	}

  	this.authService.registerUser(user).subscribe(data =>{

  		if(data.success){
        toast("Usuario registrado", 3000);
  			this.router.navigate(['dashboard-usuario']);
  		}

  		else{
        toast("Algo salió mal", 3000);
  			this.router.navigate(['dashboard-usuario']);
  		}

  	})


  }

}
