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
             .then(response =>  {
               const exams: Exam[] = []
               const examsData = response.json()
               for (let data of examsData.data) {
                 let exam: Exam = this.createExam(data);
                 exams.push(exam);
               }
               return exams;
             })
  }

  getExam(id: string): Promise<Exam> {
    return this.http.get(this.url + '/' + id)
      .toPromise()
      .then(response => this.createExam(response.json().data))
  }

  private createExam(data): Exam {
    let exam: Exam = new Exam();
    exam.id = data.id;
    exam.title = data.attributes.title;
    exam.createdAt = data.attributes["created-at"];
    exam.updatedAt = data.attributes["updated-at"];
    return exam;
  }
}
