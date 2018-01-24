import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CancelarCitaComponent } from './cancelar-cita.component';

describe('CancelarCitaComponent', () => {
  let component: CancelarCitaComponent;
  let fixture: ComponentFixture<CancelarCitaComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CancelarCitaComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CancelarCitaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
