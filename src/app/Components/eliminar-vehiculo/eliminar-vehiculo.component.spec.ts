import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EliminarVehiculoComponent } from './eliminar-vehiculo.component';

describe('EliminarVehiculoComponent', () => {
  let component: EliminarVehiculoComponent;
  let fixture: ComponentFixture<EliminarVehiculoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EliminarVehiculoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EliminarVehiculoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
