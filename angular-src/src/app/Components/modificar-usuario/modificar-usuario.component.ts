import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
@Component({
  selector: 'app-modificar-usuario',
  templateUrl: './modificar-usuario.component.html',
  styleUrls: ['./modificar-usuario.component.css']
})
export class ModificarUsuarioComponent implements OnInit {

	usuarios : any[];
	selectedUsuario : any;

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {

  	this.authService.todosUsuarios().subscribe(data=>{
  		this.usuarios =data;
  	});


  }


  onSubmit(){

  	const user ={
  		idUsuario : this.selectedUsuario.idUsuario,
  		nombre : this.selectedUsuario.Nombre,
  		apellido : this.selectedUsuario.Apellido,
  		email : this.selectedUsuario.Email,
  		password : this.selectedUsuario.Contraseña

  	}

  	if(!this.validateService.validateUpdateU(user)){
      toast("Por favor rellene todos los campos", 3000);
        		return false;
  	}

    if(!this.validateService.validateEmail(user.email)){
      toast("Por favor ingrese un email válido", 3000);
      return false;
    }

  	this.authService.updateUsuario(user).subscribe(data=>{
  		if(data.success){
        toast(data.msg, 3000);
  			this.router.navigate(['dashboard-gerente']);
  		}

  		else{
        toast("Algo salió mal", 3000);
  			this.router.navigate(['dashboard-gerente']);
  		}
  	})

  }

}
