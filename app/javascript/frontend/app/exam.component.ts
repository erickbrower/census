import { ActivatedRoute, ParamMap } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { ExamService } from './services/exam.service';
import { Location } from '@angular/common';

import 'rxjs/add/operator/switchMap';

@Component({
  selector: 'app-exam',
  template: `
  <div class="page-header">
    <h1>{{exam.title}} <small>{{exam.createdAt}}</small></h1>
  </div>
  `
})
export class ExamComponent implements OnInit {

  exam: Exam = {}

  constructor(
    private examService: ExamService,
    private route: ActivatedRoute,
    private location: Location
  ) { }

  ngOnInit(): void {
    this.route.paramMap
      .switchMap((params: ParamMap) => {
        return this.examService.getExam(params.get('id'))
      })
      .subscribe((exam: Exam) => this.exam = exam);
  }

}
