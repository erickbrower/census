import { Component, OnInit, Input } from '@angular/core';

import { Answer } from '../models/answer';
import { Question } from '../models/question';

import { AnswerService } from '../services/answer.service';

@Component({
  selector: 'app-answer-list',
  template: `
  <div class="container">
    <div class="col-md-12" *ngFor="let answer of answers">
      <app-answer [answer]="answer"></app-answer>
    </div>
  </div>
  `
})

export class AnswerListComponent implements OnInit {
  @Input() question: Question = {}
  answers: Answer[] = []

  constructor(private answerService: AnswerService) {}

  ngOnInit() {
    const questionId = parseInt(this.question.id)
    this.answerService.getQuestionAnswers(questionId)
      .then((answers: Answer[]) => this.answers = answers)
  }
}
