import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';

import { MaterializeModule } from "angular2-materialize";
import { RegistroUsuarioComponent } from './registro-usuario/registro-usuario.component';
import { InicioComponent } from './inicio/inicio.component';
import { RegistroVehiculoComponent } from './registro-vehiculo/registro-vehiculo.component';
import { SolicitarCitaComponent } from './solicitar-cita/solicitar-cita.component';


const appRoutes: Routes = [
  { path: '', redirectTo: 'inicio', pathMatch: 'full'},
  { path: 'registro-usuario', component: RegistroUsuarioComponent },
  { path: 'inicio', component: InicioComponent },
  { path: 'registro-vehiculo', component: RegistroVehiculoComponent },
  { path: 'solicitar-cita', component: SolicitarCitaComponent },
];

@NgModule({
  declarations: [
    AppComponent,
    InicioComponent,
    RegistroUsuarioComponent,
    InicioComponent,
    RegistroVehiculoComponent,
    SolicitarCitaComponent
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
