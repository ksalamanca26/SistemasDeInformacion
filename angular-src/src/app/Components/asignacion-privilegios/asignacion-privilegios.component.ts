import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
@Component({
  selector: 'app-asignacion-privilegios',
  templateUrl: './asignacion-privilegios.component.html',
  styleUrls: ['./asignacion-privilegios.component.css']
})
export class AsignacionPrivilegiosComponent implements OnInit {

	usuarios : any[];
	idUsuario : Number;
	rol : Number;

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {

  	this.authService.todosUsuarios().subscribe(data =>{
  		if(data!=undefined){
  			this.usuarios=data;
  		}
  	});

  }


  onUpdateSubmit(){

  	const usuario = {
  		idUsuario : this.idUsuario,
  		rol : this.rol
  	}

  	if(!this.validateService.validateUpdateR(usuario)){
  		this.flashMessage.show("Por favor seleccione un usuario")
  		return false;
  	}

  	this.authService.updateRol(usuario).subscribe(data =>{

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
