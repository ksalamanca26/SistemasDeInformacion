import { Injectable } from '@angular/core';
import {Http, Headers} from "@angular/http";
import 'rxjs/add/operator/map';

@Injectable()
export class AuthService {
user : any;
  constructor(private http : Http) { }

  registerUser(user){
  	let headers = new Headers();
  	headers.append('Content-Type', 'application/json');
  	return this.http.post('/register', user, {headers : headers})
  	.map(res=> res.json());

  }

  loginUser(user){
  	let headers = new Headers();
  	headers.append('Content-Type', 'application/json');
  	return this.http.post('/authenticate', user, {headers : headers})
  	.map(res => res.json());
  }

  storeUserData(user){

    localStorage.setItem('user', JSON.stringify(user));
    this.user=user;

  }

  loadUserData(){

const data=JSON.parse(localStorage.getItem('user'));
this.user=data;

  }

  getUser(){
    return this.user;
  }

  logout(){

    this.user=null;
    localStorage.clear();


  }


  registerVehiculo(vehiculo){


    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('/registrar-v',vehiculo, {headers : headers})
    .map(res => res.json());

  }


  buscarVehiculos(user){
   let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    console.log(user);
    return this.http.post('/buscar-vehiculos',user, {headers : headers})
    .map(res => res.json());

  }


  registerCita(cita){


   let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('/registrar-c',cita, {headers : headers})
    .map(res => res.json());


  }

  deleteVehiculo(vehiculo){

  let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('/eliminar-v',vehiculo, {headers : headers})
    .map(res => res.json());
  }

todosUsuarios(){

  return this.http.get('/todos-usuarios')
  .map(res => res.json());
}

  todosRol(user){
     let headers = new Headers();
    headers.append('Content-Type', 'application/json');
      return this.http.post('/todos-rol', user, {headers : headers})
  .map(res => res.json());
  }


  updateRol(user){
    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('/update-r',user,{headers : headers})
    .map(res => res.json());
  }


  buscarCitas(user){
    console.log(user);
    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('/buscar-c',user, {headers : headers})
    .map(res => res.json());
  }

  deleteCita(cita){

    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('/eliminar-c',cita, {headers : headers})
    .map(res => res.json());

  }

  todasCitas(){
    return this.http.get('/todas-citas')
    .map(res => res.json());
  }

  citasAsignadas(){
    return this.http.get('/asignadas-citas')
    .map(res => res.json());
  }


buscarUsuario(user){
    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('/buscar-u', user, {headers : headers})
    .map(res => res.json());
  }


  buscarVehiculo(vehiculo){
   let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return this.http.post('/buscar-v', vehiculo, {headers : headers})
   .map(res => res.json());
  }

  asignarFecha(cita){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return this.http.post('/update-c',cita,{headers : headers})
   .map(res => res.json());
  }


  updateVehiculo(vehiculo){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return this.http.post('/update-v',vehiculo, {headers : headers})
   .map(res => res.json());
  }


  updateUsuario(user){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/update-u',user,{headers :headers})
   .map(res => res.json());
  }

  cargar(foto){
  let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/cargar',foto,{headers :headers})
   .map(res => res.json());  
  }

  todosRepuestos(){
    return this.http.get('/todos-r')
    .map(res => res.json());
  }


  updateRepuesto(selectedRepuesto){
   let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/update-rep',selectedRepuesto,{headers :headers})
   .map(res => res.json());  
  }

  registerRepuesto(repuesto){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/register-rep',repuesto,{headers :headers})
   .map(res => res.json()); 
  }

  registerOrden(orden){
     let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/register-o',orden,{headers :headers})
   .map(res => res.json()); 
  }

  ordenesMecanico(user){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/ordenes-m',user, {headers : headers})
   .map(res => res.json());
  }

  updateOrden(orden){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/update-o',orden,{headers :headers})
   .map(res => res.json()); 
  }

  updateCitaOrden(cita){
     let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/update-c2',cita,{headers :headers})
   .map(res => res.json()); 
  }

  todosVehiculos(){
    return this.http.get('/todos-v')
    .map(res => res.json());
  }

  todasOrdenes(){
    return this.http.get('/todas-o')
    .map(res => res.json());
  }

  cerrarOrden(orden){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/cerrar-o',orden,{headers :headers})
   .map(res => res.json()); 
  }

  qrOrden(orden){
        let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/qr-orden',orden,{headers :headers})
   .map(res => res.json()); 
  }

  emailQR(qr){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('/email-qr',qr,{headers :headers})
   .map(res => res.json()); 
  }



}
