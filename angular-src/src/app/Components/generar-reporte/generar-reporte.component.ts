import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
import {ExcelService} from '../../services/excel.service';
@Component({
  selector: 'app-generar-reporte',
  templateUrl: './generar-reporte.component.html',
  styleUrls: ['./generar-reporte.component.css']
})
export class GenerarReporteComponent implements OnInit {

	clientes : any[];
	mecanicos : any[];
	vehiculos : any[];

	columnasCliente : any[];
	columnasMecanico : any[];
	columnasVehiculo : any[];
	columnasModelo : any[];


	opcion : Number;

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router,
  	private excelService : ExcelService) { }

  ngOnInit() {

  	const cliente = {
  		rol : 1
  	}

  	const mecanico ={
  		rol : 2
  	}

  	this.columnasCliente=["Nombre", "Apellido", "Email"];

  	this.columnasMecanico=["Nombre", "Apellido"];

  	this.columnasVehiculo=["Modelo", "Placa"];

  	this.authService.todosRol(cliente).subscribe(data=>{
  		this.clientes=data;
  	})

  	this.authService.todosRol(mecanico).subscribe(data=>{
  		this.mecanicos=data;
  	})

  	this.authService.todosVehiculos().subscribe(data=>{
  		this.vehiculos =data;
  	})

  }


  onCliente(cliente){

  	const user = {
  		id : cliente.idUsuario
  	}

  	this.authService.todosRol(user).subscribe(data=>{
  		if(data){
  			const json = data[0];
  			console.log(json);
  			
  			this.excelService.exportAsExcelFile(data, "Reporte Cliente");
  			toast("Reporte generado", 3000);
  			this.router.navigate(['dashboard-gerente']);
  		}
  		else{
  			toast("Algo salió mal", 3000);
  			this.router.navigate(['dashboard-gerente']);
  		}
  	})
  }


  onMecanico(mecanico){
  	const user = {
  		id : mecanico.idUsuario
  	}

  	this.authService.todosRol(user).subscribe(data=>{
  		if(data){
  			const json = data[0];
  			console.log(json);
  			
  			this.excelService.exportAsExcelFile(data, "Reporte Cliente");
  			toast("Reporte generado", 3000);
  			this.router.navigate(['dashboard-gerente']);
  		}
  		else{
  			toast("Algo salió mal", 3000);
  			this.router.navigate(['dashboard-gerente']);
  		}
  	})
  }








}
