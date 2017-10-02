import { ActivatedRoute, ParamMap } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';

import { Exam } from '../models/exam';
import { Question } from '../models/question';

import { QuestionService } from '../services/question.service';

import 'rxjs/add/operator/switchMap';

@Component({
  selector: 'app-exam-question-list',
  template: `
  <div class="table-responsive">
    <table *ngFor="let question of questions" class="table">
      <tr>
        <th width="30px" scope="row">{{question.number}}</th>
        <th scope="row">{{question.text}}</th>
      </tr>
      <tr>
        <td></td>
        <td>
          <div class="container">
            <div class="col-md-12" *ngFor="let answer of question.answers">
              <div class="col-md-1">
                <input type="radio" name="{{question.id}}" value="{{answer.id}}">
                <strong>{{answer.letter}}.</strong>
              </div>
              <div class="col-md-11">{{answer.text}}</div>
            </div>
          </div>
        </td>
      </tr>
    </table>
  </div>
  `
})
export class ExamQuestionListComponent implements OnInit {
  questions: Question[] = []

  constructor(
    private questionService: QuestionService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.route.paramMap
      .switchMap((params: ParamMap) => {
        return this.questionService.getExamQuestions(params.get('id'))
      })
      .subscribe((questions: Questions[]) => this.questions = questions);
  }
}
