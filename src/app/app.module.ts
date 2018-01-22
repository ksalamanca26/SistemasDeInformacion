import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';

import { MaterializeModule } from "angular2-materialize";
import { RegistroUsuarioComponent } from './registro-usuario/registro-usuario.component';
import { InicioComponent } from './inicio/inicio.component';


const appRoutes: Routes = [
  { path: '', redirectTo: 'inicio', pathMatch: 'full'},
  { path: 'registro-usuario', component: RegistroUsuarioComponent },
  { path: 'inicio', component: InicioComponent },
  
];

@NgModule({
  declarations: [
    AppComponent,
    InicioComponent,
    RegistroUsuarioComponent,
    InicioComponent
  ],
  imports: [RouterModule.forRoot(
      appRoutes,
      { enableTracing: true } // <-- debugging purposes only
    ),
    BrowserModule,
    MaterializeModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
