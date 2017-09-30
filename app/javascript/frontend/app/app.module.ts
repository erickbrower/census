import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router'

import { AnswerComponent } from './components/answer.component';
import { AnswerListComponent } from './components/answer-list.component';;
import { AnswerService } from './services/answer.service';
import { AppComponent } from './components/app.component';
import { ExamComponent } from './components/exam.component';
import { ExamListComponent } from './components/exam-list.component';
import { ExamQuestionListComponent } from './components/exam-question-list.component';
import { ExamService } from './services/exam.service';
import { NavbarComponent } from './components/navbar.component';
import { QuestionService } from './services/question.service';

@NgModule({
  declarations: [
    AnswerComponent
    AnswerListComponent,
    AppComponent,
    ExamComponent,
    ExamListComponent,
    ExamQuestionListComponent,
    NavbarComponent,
  ],
  imports: [
    BrowserModule,
    HttpModule,
    RouterModule.forRoot([
      {
        path: '',
        component: ExamListComponent
      },
      {
        path: 'exams/:id',
        component: ExamComponent
      }
    ])
  ],
  providers: [
    AnswerService
    ExamService,
    QuestionService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
