import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { AppComponent } from '../../app.component';
import { toast } from "angular2-materialize";

@Component({
  selector: 'app-iniciar-sesion',
  templateUrl: './iniciar-sesion.component.html',
  styleUrls: ['./iniciar-sesion.component.css']
})
export class IniciarSesionComponent implements OnInit {

	email : String;
	password : String;

  constructor(private validateService : ValidateService,
  	private authService : AuthService,
  	private flashMessage : FlashMessagesService,
    private appComponent : AppComponent,
  	private router : Router) { }

  ngOnInit() {
  }

  onLoginSubmit(){

  	const user= {
  		email : this.email,
  		password : this.password
  	}

  	if(!this.validateService.validateLogin(user)){
      toast("Por favor rellene todos los campos", 3000);
  		return false;
  	}

  	if(!this.validateService.validateEmail(user.email)){
      toast("Por favor ingrese un email válido", 3000);
  		return false;
  	}	


  	this.authService.loginUser(user).subscribe(data =>{
  		if(data.success){
        this.authService.storeUserData(data.user);
        this.appComponent.user=data.user;
        toast("Bienvenido "+data.user.nombre, 3000);
        if(data.user.rol ==1){
          this.router.navigate(['/dashboard']);
        }

        else if(data.user.rol==2){
          this.router.navigate(['/dashboard-mecanico']);
        }

        else if(data.user.rol==3){
          this.router.navigate(['/dashboard-gerente']);
        }
        else{
          this.router.navigate(['/dashboard-usuario']);
        }
  			
  		}

  		else{
        toast(data.msg, 3000);
  		}
  	});
  }

}
