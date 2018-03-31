import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";

@Component({
  selector: 'app-cancelar-cita',
  templateUrl: './cancelar-cita.component.html',
  styleUrls: ['./cancelar-cita.component.css']
})
export class CancelarCitaComponent implements OnInit {

	citas : any[];
	selectedCita : any;
  columnas : any[];

  constructor(private validateService : ValidateService,
  	private authService : AuthService,
  	private router : Router,
  	private flashMessage : FlashMessagesService) { }

  ngOnInit() {

    this.columnas=["Modelo", "Placa", "Estado Cita"];
  	this.authService.loadUserData();
  	const user=this.authService.user;
  	this.authService.buscarCitas(user).subscribe(data=>{
  		if(data!=undefined){
  			this.citas=data[0];
  		}
  	});
  }


onClick(cita){
  this.selectedCita=cita;
}

  onDeleteSubmit(){

  	if(!this.validateService.validateDeleteC(this.selectedCita)){
      toast("Por favor seleccione una cita", 3000);
  		return false;

  	}


  	this.authService.deleteCita(this.selectedCita).subscribe(data=>{
  		if(data.success){
        toast(data.msg, 3000);
  			this.router.navigate(['dashboard']);
  		}

  		else{
        toast("Algo salio mal", 3000);
  			this.router.navigate(['dashboard']);
  		}
  	})

  }

}
