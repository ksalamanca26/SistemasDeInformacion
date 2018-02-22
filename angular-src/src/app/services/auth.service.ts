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
  	return this.http.post('http://localhost:3000/register', user, {headers : headers})
  	.map(res=> res.json());

  }

  loginUser(user){
  	let headers = new Headers();
  	headers.append('Content-Type', 'application/json');
  	return this.http.post('http://localhost:3000/authenticate', user, {headers : headers})
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
    return this.http.post('http://localhost:3000/registrar-v',vehiculo, {headers : headers})
    .map(res => res.json());

  }


  buscarVehiculos(user){
   let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    console.log(user);
    return this.http.post('http://localhost:3000/buscar-v',user, {headers : headers})
    .map(res => res.json());

  }


  registerCita(cita){


   let headers = new Headers();
    headers.append('Content-Type', 'application/json');
    return this.http.post('http://localhost:3000/registrar-c',cita, {headers : headers})
    .map(res => res.json());


  }



}
