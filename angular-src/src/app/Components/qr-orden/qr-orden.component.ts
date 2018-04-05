import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import { ActivatedRoute } from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
@Component({
  selector: 'app-qr-orden',
  templateUrl: './qr-orden.component.html',
  styleUrls: ['./qr-orden.component.css']
})
export class QrOrdenComponent implements OnInit {

	idOrden :  any;

	ordenes : any[];

	columnas : any[];

  url : any;

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router,
  	private route : ActivatedRoute) { }

  ngOnInit() {
  	this.columnas=['idOrden', 'Estado Orden', 'Estado Cita', 'Nombre Mecanico', 'Apellido Mecanico', 'Modelo Vehiculo', 'Placa', 'Serial del Motor'];

  	this.route.queryParams.map(params=>params.orden).subscribe(params=>{
  		this.idOrden =params
  	});

  	const orden = {
  		idOrden : this.idOrden
  	}
  	this.authService.qrOrden(orden).subscribe(data=>{
  		if(data){
  			console.log(data);
  			this.ordenes=data[0];
        this.url=this.ordenes[0].Foto;
  		}

  		else{
  			toast("Algo salió mal", 3000);
  			this.router.navigate['inicio'];
  		}
  		
  	})


  }

}
