
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
             .then(response => {
               let questions: Question[] = [];
               let questionsData = response.json();
               for (let data of questionsData.data) {
                 let question: Question = this.buildQuestion(data);
                 questions.push(question);
               }
               return questions;
             })
  }

  private buildQuestion(data): Question {
    let question: Question = new Question();
    question.id = data.id;
    question.examId = data.attributes["exam-id"]
    question.number = data.attributes.number;
    question.text = data.attributes.text;
    question.createdAt = data.attributes["created-at"];
    question.updatedAt = data.attributes["updated-at"];
    return question;
  }
}
