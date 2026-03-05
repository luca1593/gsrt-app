import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Creneau } from './creneau';

describe('Creneau', () => {
  let component: Creneau;
  let fixture: ComponentFixture<Creneau>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [Creneau]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Creneau);
    component = fixture.componentInstance;
    await fixture.whenStable();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
