import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';

import { Exam } from '../models/exam';

import 'rxjs/add/operator/toPromise';

@Injectable()
export class ExamService {
  private url: string = 'http://localhost:3000/api/v1/exams';

  constructor(private http: Http) { }

  getExams(): Promise<Exam[]> {
    return this.http.get(this.url)
             .toPromise()
             .then(response => response.json() as Exam[])
  }

  getExam(id: string): Promise<Exam> {
    return this.http.get(this.url + '/' + id)
      .toPromise()
      .then(response => response.json() as Exam)
  }
}
