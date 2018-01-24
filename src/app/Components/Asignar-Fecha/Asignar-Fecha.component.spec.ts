import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AsignarFechaComponent } from './Asignar-Fecha.component';

describe('AsignarFechaComponent', () => {
  let component: AsignarFechaComponent;
  let fixture: ComponentFixture<AsignarFechaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AsignarFechaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AsignarFechaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
