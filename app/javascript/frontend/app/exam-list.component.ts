import { Component, OnInit } from '@angular/core';
import { ExamService } from './services/exam.service';
import { Exam } from './models/exam';

@Component({
  selector: 'app-exam-list',
  template: `
  <div *ngFor="let exam of exams" class="media">
    <div class="media-left">
      <a href="#">
        <img class="media-object" src="http://via.placeholder.com/64x64" alt="...">
      </a>
    </div>
    <div class="media-body">
      <a [routerLink]="['/exams', exam.id]" >
        <h4 class="media-heading">{{exam.title}}</h4>
      </a>
      Created: {{exam.createdAt}}
    </div>
  </div>
  `
})
export class ExamListComponent implements OnInit {
  exams: Exam[] = []

  getExams(): void {
    this.examService.getExams()
      .then(exams => this.exams = exams);
  }

  constructor(private examService: ExamService) {}

  ngOnInit() {
    this.getExams();
  }
}
