import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router'

import { AppComponent } from './components/app.component';
import { ExamComponent } from './components/exam.component';
import { ExamListComponent } from './components/exam-list.component';
import { ExamQuestionListComponent } from './components/exam-question-list.component';
import { NavbarComponent } from './components/navbar.component';

import { ExamService } from './services/exam.service';
import { QuestionService } from './services/question.service';

@NgModule({
  declarations: [
    AppComponent,
    ExamComponent,
    ExamListComponent,
    ExamQuestionListComponent,
    NavbarComponent
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
  providers: [ExamService, QuestionService],
  bootstrap: [AppComponent]
})
export class AppModule { }
