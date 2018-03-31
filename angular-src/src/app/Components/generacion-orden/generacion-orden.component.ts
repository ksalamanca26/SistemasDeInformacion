import { Component, OnInit } from '@angular/core';
import {ValidateService} from '../../services/validate.service';
import {AuthService} from '../../services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
@Component({
  selector: 'app-generacion-orden',
  templateUrl: './generacion-orden.component.html',
  styleUrls: ['./generacion-orden.component.css']
})
export class GeneracionOrdenComponent implements OnInit {

	citas : any[];
	selectedCita : any;
  mecanicos : any[];
  selectedMecanico : any;
  foto : any;

  herramientas : any;
  accesorios : any;
  caucho : any;
  llaves : any;
  gato : any;
  sonido : any;
  carroceria : any;

  columnas : any[];

	

  constructor(private authService : AuthService,
  	private validateService : ValidateService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {

    this.columnas=['Nombre', 'Apellido', 'Email', 'Modelo', 'Placa', 'Año', 'Estado Vehiculo', 'Estado Cita'];
  	this.authService.citasAsignadas().subscribe(data=>{
  		if(data!=undefined){
  			this.citas=data[0];
  		}
  	});

    this.authService.todosMecanicos().subscribe(data=>{
      if(data){
        this.mecanicos=data;
      }
    })

  }


  onClick(cita){
    this.selectedCita=cita;
  }

  onSubmit(){

    if(this.selectedMecanico==undefined){
      toast("Por favor seleccione un mecánico", 3000);
      return false;
    }

    const orden ={
      herramientas : this.herramientas,
      accesorios : this.accesorios,
      caucho : this.caucho,
      llaves : this.llaves,
      gato : this.gato,
      sonido : this.sonido,
      carroceria : this.carroceria,
      idVehiculo : this.selectedCita.idVehiculo,
      idUsuario : this.selectedMecanico.idUsuario
    }

    if(!this.validateService.validateRegisterOrden(orden)){
      console.log("Entre acá");
      toast("Por favor rellene todos los campos", 3000);
      return false;
    }

    this.authService.registerOrden(orden).subscribe(data =>{
      console.log("Y despues aca");
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





