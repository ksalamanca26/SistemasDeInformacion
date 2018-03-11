import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';

import { FormsModule } from '@angular/forms';

import {HttpModule} from '@angular/http';

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
import { ModificarVehiculoComponent } from './Components/modificar-vehiculo/modificar-vehiculo.component';
import { CancelarCitaComponent } from './Components/cancelar-cita/cancelar-cita.component';
import { RegistrarAdmComponent } from './Components/registrar-adm/registrar-adm.component';

import {ValidateService} from './services/validate.service';
import {FlashMessagesModule} from "angular2-flash-messages";
import {AuthService} from './services/auth.service';
import { DashboardMecanicoComponent } from './Components/dashboard-mecanico/dashboard-mecanico.component';
import { DashboardGerenteComponent } from './Components/dashboard-gerente/dashboard-gerente.component';




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
  { path: 'modificar-vehiculo', component : ModificarVehiculoComponent},
  { path: 'cancelar-cita', component: CancelarCitaComponent },
  { path: 'registrar-adm', component: RegistrarAdmComponent },
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
    RegistrarAdmComponent,
    ModificarVehiculoComponent,
    DashboardMecanicoComponent,
    DashboardGerenteComponent,
  ],
  imports: [RouterModule.forRoot(
      appRoutes,
      { enableTracing: true } // <-- debugging purposes only
    ),
    FormsModule,
    HttpModule,
    BrowserModule,
    MaterializeModule,
    FlashMessagesModule.forRoot()
  ],
  providers: [ValidateService, AuthService],
  bootstrap: [AppComponent]
})
export class AppModule { }
