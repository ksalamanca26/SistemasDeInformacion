import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';

import { MaterializeModule } from "angular2-materialize";
import { RegistroUsuarioComponent } from './Components/registro-usuario/registro-usuario.component';
import { InicioComponent } from './Components/inicio/inicio.component';
import { RegistroVehiculoComponent } from './Components/registro-vehiculo/registro-vehiculo.component';
import { SolicitarCitaComponent } from './Components/solicitar-cita/solicitar-cita.component';
import { GeneracionOrdenComponent } from './Components/generacion-orden/generacion-orden.component';
import { GenerarReporteComponent } from './Components/generar-reporte/generar-reporte.component';
import { AsignacionPrivilegiosComponent } from './Components/asignacion-privilegios/asignacion-privilegios.component';
import { AsignarFechaComponent } from './Components/Asignar-Fecha/Asignar-Fecha.component';
import { RespuestosComponent } from './Components/respuestos/respuestos.component';
import { IniciarSesionComponent } from './Components/iniciar-sesion/iniciar-sesion.component';
import { DashboardUsuarioComponent } from './Components/dashboard-usuario/dashboard-usuario.component';
import { SideNavComponent } from './Components/side-nav/side-nav.component';
import { AboutComponent } from './Components/about/about.component';
import { DashboardComponent } from './Components/dashboard/dashboard.component';
import { EliminarVehiculoComponent } from './Components/eliminar-vehiculo/eliminar-vehiculo.component';
import { CancelarCitaComponent } from './Components/cancelar-cita/cancelar-cita.component';




const appRoutes: Routes = [
  { path: '', redirectTo: 'inicio', pathMatch: 'full'},
  { path: 'registro-usuario', component: RegistroUsuarioComponent },
  { path: 'inicio', component: InicioComponent },
  { path: 'registro-vehiculo', component: RegistroVehiculoComponent },
  { path: 'solicitar-cita', component: SolicitarCitaComponent },
  { path: 'generacion-orden', component: GeneracionOrdenComponent },
  { path: 'generar-reporte', component: GenerarReporteComponent },
  { path: 'Asignar-Fecha', component: AsignarFechaComponent },
  { path: 'asignacion-privilegios', component: AsignacionPrivilegiosComponent },
  { path: 'repuestos', component: RespuestosComponent },
  { path: 'iniciar-sesion', component: IniciarSesionComponent },
  { path: 'dashboard-usuario', component: DashboardUsuarioComponent },
  { path: 'side-nav', component: SideNavComponent },
  { path: 'about', component: AboutComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: 'eliminar-vehiculo', component: EliminarVehiculoComponent },
  { path: 'cancelar-cita', component: CancelarCitaComponent },
];

@NgModule({
  declarations: [
    AppComponent,
    InicioComponent,
    RegistroUsuarioComponent,
    InicioComponent,
    RegistroVehiculoComponent,
    SolicitarCitaComponent,
    GeneracionOrdenComponent,
    GenerarReporteComponent,
    AsignacionPrivilegiosComponent,
    AsignarFechaComponent,
    RespuestosComponent,
    IniciarSesionComponent,
    DashboardUsuarioComponent,
    SideNavComponent,
    AboutComponent,
    DashboardComponent,
    EliminarVehiculoComponent,
    CancelarCitaComponent,
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
