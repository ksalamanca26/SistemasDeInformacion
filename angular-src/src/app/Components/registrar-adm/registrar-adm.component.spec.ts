import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistrarAdmComponent } from './registrar-adm.component';

describe('RegistrarAdmComponent', () => {
  let component: RegistrarAdmComponent;
  let fixture: ComponentFixture<RegistrarAdmComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegistrarAdmComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistrarAdmComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
