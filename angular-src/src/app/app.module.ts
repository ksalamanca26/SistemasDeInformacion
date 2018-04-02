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
import { DashboardMecanicoComponent } from './Components/dashboard-mecanico/dashboard-mecanico.component';
import { DashboardGerenteComponent } from './Components/dashboard-gerente/dashboard-gerente.component';
import { EliminarVehiculoComponent } from './Components/eliminar-vehiculo/eliminar-vehiculo.component';
import { ModificarVehiculoComponent } from './Components/modificar-vehiculo/modificar-vehiculo.component';
import { CancelarCitaComponent } from './Components/cancelar-cita/cancelar-cita.component';
import { RegistrarAdmComponent } from './Components/registrar-adm/registrar-adm.component';
import { ModificarUsuarioComponent } from './Components/modificar-usuario/modificar-usuario.component';
import {ValidateService} from './services/validate.service';
import {FlashMessagesModule} from "angular2-flash-messages";
import {AuthService} from './services/auth.service';
import { ModificarOrdenComponent } from './Components/modificar-orden/modificar-orden.component';
import {ExcelService} from './services/excel.service';
import { FinalizarOrdenComponent } from './Components/finalizar-orden/finalizar-orden.component';
import {NgxQRCodeModule } from 'ngx-qrcode2';
import { QrOrdenComponent } from './Components/qr-orden/qr-orden.component';







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
  { path: 'dashboard-mecanico', component: DashboardMecanicoComponent },
  { path: 'dashboard-gerente', component: DashboardGerenteComponent },
  { path: 'side-nav', component: SideNavComponent },
  { path: 'about', component: AboutComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: 'eliminar-vehiculo', component: EliminarVehiculoComponent },
  { path: 'modificar-vehiculo', component : ModificarVehiculoComponent},
  { path: 'cancelar-cita', component: CancelarCitaComponent },
  { path: 'registrar-adm', component: RegistrarAdmComponent },
  { path: 'modificar-usuario', component: ModificarUsuarioComponent },
  { path: 'modificar-orden', component: ModificarOrdenComponent },
  { path: 'finalizar-orden', component: FinalizarOrdenComponent },
  { path: 'qr-orden', component: QrOrdenComponent },

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
    ModificarUsuarioComponent,
    ModificarOrdenComponent,
    FinalizarOrdenComponent,
    QrOrdenComponent,
  ],
  imports: [RouterModule.forRoot(
      appRoutes,
      { enableTracing: true } // <-- debugging purposes only
    ),
    FormsModule,
    HttpModule,
    BrowserModule,
    MaterializeModule,
    FlashMessagesModule.forRoot(),
    NgxQRCodeModule
  ],
  providers: [ValidateService, AuthService, ExcelService],
  bootstrap: [AppComponent]
})
export class AppModule { }
