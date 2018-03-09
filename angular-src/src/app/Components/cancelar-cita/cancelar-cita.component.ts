import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";

@Component({
  selector: 'app-cancelar-cita',
  templateUrl: './cancelar-cita.component.html',
  styleUrls: ['./cancelar-cita.component.css']
})
export class CancelarCitaComponent implements OnInit {

	citas : any[];
	selectedCita : any;

  constructor(private validateService : ValidateService,
  	private authService : AuthService,
  	private router : Router,
  	private flashMessage : FlashMessagesService) { }

  ngOnInit() {

  	this.authService.loadUserData();
  	const user=this.authService.user;
  	this.authService.buscarCitas(user).subscribe(data=>{
  		if(data!=undefined){
  			this.citas=data;
  		}
  	});
  }


  onDeleteSubmit(){

  	if(!this.validateService.validateDeleteC(this.selectedCita)){

  		this.flashMessage.show("Por favor seleccione una cita",{cssClass : 'alert-danger', timeout : 3000})
  		return false;

  	}


  	this.authService.deleteCita(this.selectedCita).subscribe(data=>{
  		if(data.success){
  			this.flashMessage.show(data.msg, {cssClass : 'alert-success', timeout : 3000})
  			this.router.navigate(['dashboard']);
  		}

  		else{
  			this.flashMessage.show("Algo salio mal", {cssClass : 'alert-danger', timeout : 3000})
  			this.router.navigate(['dashboard']);
  		}
  	})

  }

}
