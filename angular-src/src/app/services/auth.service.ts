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
  	return this.http.post('http://localhost:8080/register', user, {headers : headers})
  	.map(res=> res.json());

  }

  loginUser(user){
  	let headers = new Headers();
  	headers.append('Content-Type', 'application/json');
  	return this.http.post('http://localhost:8080/authenticate', user, {headers : headers})
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
    return this.http.post('http://localhost:8080/registrar-v',vehiculo, {headers : headers})
    .map(res => res.json());

  }


  buscarVehiculos(user){
   let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    console.log(user);
    return this.http.post('http://localhost:8080/buscar-vehiculos',user, {headers : headers})
    .map(res => res.json());

  }


  registerCita(cita){


   let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('http://localhost:8080/registrar-c',cita, {headers : headers})
    .map(res => res.json());


  }

  deleteVehiculo(vehiculo){

  let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('http://localhost:8080/eliminar-v',vehiculo, {headers : headers})
    .map(res => res.json());
  }

todosUsuarios(){

  return this.http.get('http://localhost:8080/todos-usuarios')
  .map(res => res.json());
}

  todosRol(user){
     let headers = new Headers();
    headers.append('Content-Type', 'application/json');
      return this.http.post('http://localhost:8080/todos-rol', user, {headers : headers})
  .map(res => res.json());
  }


  updateRol(user){
    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('http://localhost:8080/update-r',user,{headers : headers})
    .map(res => res.json());
  }


  buscarCitas(user){
    console.log(user);
    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('http://localhost:8080/buscar-c',user, {headers : headers})
    .map(res => res.json());
  }

  deleteCita(cita){

    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('http://localhost:8080/eliminar-c',cita, {headers : headers})
    .map(res => res.json());

  }

  todasCitas(){
    return this.http.get('http://localhost:8080/todas-citas')
    .map(res => res.json());
  }

  citasAsignadas(){
    return this.http.get('http://localhost:8080/asignadas-citas')
    .map(res => res.json());
  }


buscarUsuario(user){
    let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('http://localhost:8080/buscar-u', user, {headers : headers})
    .map(res => res.json());
  }


  buscarVehiculo(vehiculo){
   let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return this.http.post('http://localhost:8080/buscar-v', vehiculo, {headers : headers})
   .map(res => res.json());
  }

  asignarFecha(cita){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return this.http.post('http://localhost:8080/update-c',cita,{headers : headers})
   .map(res => res.json());
  }


  updateVehiculo(vehiculo){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return this.http.post('http://localhost:8080/update-v',vehiculo, {headers : headers})
   .map(res => res.json());
  }


  updateUsuario(user){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/update-u',user,{headers :headers})
   .map(res => res.json());
  }

  cargar(foto){
  let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/cargar',foto,{headers :headers})
   .map(res => res.json());  
  }

  todosRepuestos(){
    return this.http.get('http://localhost:8080/todos-r')
    .map(res => res.json());
  }


  updateRepuesto(selectedRepuesto){
   let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/update-rep',selectedRepuesto,{headers :headers})
   .map(res => res.json());  
  }

  registerRepuesto(repuesto){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/register-rep',repuesto,{headers :headers})
   .map(res => res.json()); 
  }

  registerOrden(orden){
     let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/register-o',orden,{headers :headers})
   .map(res => res.json()); 
  }

  ordenesMecanico(user){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/ordenes-m',user, {headers : headers})
   .map(res => res.json());
  }

  updateOrden(orden){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/update-o',orden,{headers :headers})
   .map(res => res.json()); 
  }

  updateCitaOrden(cita){
     let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/update-c2',cita,{headers :headers})
   .map(res => res.json()); 
  }

  todosVehiculos(){
    return this.http.get('http://localhost:8080/todos-v')
    .map(res => res.json());
  }

  todasOrdenes(){
    return this.http.get('http://localhost:8080/todas-o')
    .map(res => res.json());
  }

  cerrarOrden(orden){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/cerrar-o',orden,{headers :headers})
   .map(res => res.json()); 
  }

  qrOrden(orden){
        let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/qr-orden',orden,{headers :headers})
   .map(res => res.json()); 
  }

  emailQR(qr){
    let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/email-qr',qr,{headers :headers})
   .map(res => res.json()); 
  }

loadImg(file) {
    return new Promise((resolve, reject) => {
      let tipo;
      if (file) {
        switch (file.type) {
          case 'image/gif':
            tipo = 'data:image/gif;base64,';
            break;
          case 'image/jpeg':
            tipo = 'data:image/jpeg;base64,';
            break;
          case 'image/png':
            tipo = 'data:image/png;base64,';
            break;
          case 'image/svg+xml':
            tipo = 'data:image/svg+xml;base64,';
            break;
          default:
            tipo = null;
            return;
        }
        const reader = new FileReader();
        if(tipo) {
          reader.onload = readEvt => {
            const binaryString = (readEvt.target as any).result;
            const base64 = btoa(binaryString);
            const resultado = tipo + base64;
            resolve(resultado);
          }
          reader.readAsBinaryString(file);
        } else {
          reject('Formato de Imagen Inválido')
        }
      } else {
        reject('Formato de Imagen Inválido');
      }
    });
  }


  reporteCliente(user){
         let headers = new Headers();
   headers.append('Content-Type', 'application/json');
   return  this.http.post('http://localhost:8080/reporte-c',user,{headers :headers})
   .map(res => res.json()); 
  }

}
