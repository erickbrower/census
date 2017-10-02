import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';

import { Question } from '../models/question';

import 'rxjs/add/operator/toPromise';

@Injectable()
export class QuestionService {
  private url: string = 'http://localhost:3000/api/v1/exams'

  constructor(private http: Http) {}

  getExamQuestions(examId: number): Promise<Question[]> {
    return this.http.get([this.url, examId, 'questions'].join('/'))
             .toPromise()
             .then(response => response.json() as Question[])
  }
}
