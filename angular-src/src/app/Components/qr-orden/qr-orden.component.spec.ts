import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { QrOrdenComponent } from './qr-orden.component';

describe('QrOrdenComponent', () => {
  let component: QrOrdenComponent;
  let fixture: ComponentFixture<QrOrdenComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ QrOrdenComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(QrOrdenComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
