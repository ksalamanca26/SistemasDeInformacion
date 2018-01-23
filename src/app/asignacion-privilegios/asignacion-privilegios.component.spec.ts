import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AsignacionPrivilegiosComponent } from './asignacion-privilegios.component';

describe('AsignacionPrivilegiosComponent', () => {
  let component: AsignacionPrivilegiosComponent;
  let fixture: ComponentFixture<AsignacionPrivilegiosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AsignacionPrivilegiosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AsignacionPrivilegiosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
