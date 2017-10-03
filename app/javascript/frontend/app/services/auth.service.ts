import { Injectable } from '@angular/core'
import { Headers, Http } from '@angular/http'

import { AuthRequest } from '../models/auth-request'
import { ErrorResponse } from '../models/error-response'
import { User } from '../models/user'


import 'rxjs/add/operator/toPromise'

@Injectable()
export class AuthService {
  private url: string = 'http://localhost:3000/api/v1/authenticate'

  constructor(private http: Http) { }

  authenticate(authRequest: AuthRequest): Promise<ErrorResponse | User> {
    const { email, password } = authRequest
    return this.http.post(this.url, { email, password })
             .toPromise()
             .then((response) => {
               const data = response.json()
               if (data.id && data.email && data.auth_token) {
                 return data as User
               }
             })
             .catch((response) => {
               // Pass messages here
               return new ErrorResponse()
             });
  }
}
