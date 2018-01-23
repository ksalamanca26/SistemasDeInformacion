import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GeneracionOrdenComponent } from './generacion-orden.component';

describe('GeneracionOrdenComponent', () => {
  let component: GeneracionOrdenComponent;
  let fixture: ComponentFixture<GeneracionOrdenComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GeneracionOrdenComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GeneracionOrdenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
