import { Injectable } from '@angular/core';
import { Headers, Http } from '@angular/http';

import { Answer } from '../models/answer';

import 'rxjs/add/operator/toPromise';

@Injectable()
export class AnswerService {
  private url: string = 'http://localhost:3000/api/v1/questions';

  constructor(private http: Http) { }

  getQuestionAnswers(questionId: number): Promise<Answer[]> {
    return this.http.get([this.url, questionId, 'answers'].join('/'))
             .toPromise()
             .then(response => {
               const answers: Answer[] = [];
               const answersData = response.json();
               for (let data of answersData.data) {
                 const answer: Answer = this.buildAnswer(data);
                 answers.push(answer);
               }
               return answers;
             })
  }

  private buildAnswer(data): Answer {
    const answer: Answer = new Answer();
    answer.id = data.id;
    answer.questionId = data.attributes["question-id"];
    answer.letter = data.attributes.letter;
    answer.text = data.attributes.text;
    answer.correct = data.attributes.correct;
    answer.createdAt = data.attributes["created-at"];
    answer.updatedAt = data.attributes["updated-at"];
    return answer;
  }
}
