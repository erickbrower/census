import { Component, OnInit, Input } from '@angular/core';

import { Answer } from '../models/answer';

@Component({
  selector: 'app-answer',
  template: `
    <div class="col-md-1">{{answer.letter}}</div>
    <div class="col-md-11">{{answer.text}}</div>
  `
})
export class AnswerComponent implements OnInit {
  @Input() answer: Answer = {}

  constructor() {}

  ngOnInit() {}
}
