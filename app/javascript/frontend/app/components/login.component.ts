import { AuthRequest } from '../models/auth-request'
import { AuthService } from '../services/auth.service';
import { Component, OnChanges } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-login',
  template: `
  <div class="container">
    <div class="col-md-4"></div>
    <div class="col-md-4">
      <form class="form-signin" [formGroup]="loginForm" (ngSubmit)="onSubmit()" novalidate>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" formControlName="email" id="inputEmail" class="form-control" placeholder="Email address" autofocus="">
        <br>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" formControlName="password" id="inputPassword" class="form-control" placeholder="Password" required="">
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button [disabled]="loginForm.pristine" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>
    </div>
    <div class="col-md-4"></div>
  </div>
  `
})
export class LoginComponent {
  loginForm: FormGroup

  createForm(): void {
    this.loginForm = this.fb.group({
      email: '',
      password: ''
    })
  }

  onSubmit(): void {
    const authRequest = this.loginForm.value as AuthRequest
    this.authService.authenticate(authRequest)
      .then(user => {
        // if (user.auth_token) {
        //   localStorage.set('census_auth_token', user.auth_token)
        // }
      })
  }

  constructor(
    private fb: FormBuilder,
    private authService: AuthService
  ) {
    this.createForm()
  }

}
