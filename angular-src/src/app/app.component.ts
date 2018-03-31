import { Component } from '@angular/core';
import {ValidateService} from './services/validate.service';
import {AuthService} from './services/auth.service';
import {Router} from '@angular/router';
import {FlashMessagesService} from "angular2-flash-messages";
import { toast } from "angular2-materialize";
@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app';
  user : any;


  constructor(private validateService : ValidateService,
  	private authService : AuthService,
  	private flashMessage : FlashMessagesService,
  	private router : Router) { }

  ngOnInit() {
    this.user=this.authService.user;
  }

  onLogoutClick(){
    if(this.user){
      console.log(this.user);
this.authService.logout();
    this.user=undefined;
    toast("Sesión cerrada", 3000);
    this.router.navigate(['inicio']);
    return false;
    }
  	
  }

}
