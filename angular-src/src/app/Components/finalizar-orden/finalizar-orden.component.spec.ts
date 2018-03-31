import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FinalizarOrdenComponent } from './finalizar-orden.component';

describe('FinalizarOrdenComponent', () => {
  let component: FinalizarOrdenComponent;
  let fixture: ComponentFixture<FinalizarOrdenComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FinalizarOrdenComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FinalizarOrdenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
