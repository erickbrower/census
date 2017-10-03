import { AnswerService } from './services/answer.service';
import { AppComponent } from './components/app.component';
import { AuthService } from './services/auth.service';
import { BrowserModule } from '@angular/platform-browser';
import { ExamComponent } from './components/exam.component';
import { ExamListComponent } from './components/exam-list.component';
import { ExamQuestionListComponent } from './components/exam-question-list.component';
import { ExamService } from './services/exam.service';
import { HttpModule } from '@angular/http';
import { LoginComponent } from './components/login.component';
import { NavbarComponent } from './components/navbar.component';
import { NgModule } from '@angular/core';
import { QuestionService } from './services/question.service';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router'

@NgModule({
  declarations: [
    AppComponent,
    ExamComponent,
    ExamListComponent,
    ExamQuestionListComponent,
    LoginComponent,
    NavbarComponent,
  ],
  imports: [
    BrowserModule,
    HttpModule,
    ReactiveFormsModule,
    RouterModule.forRoot([
      {
        path: '',
        component: ExamListComponent
      },
      {
        path: 'exams/:id',
        component: ExamComponent
      },
      {
        path: 'login',
        component: LoginComponent
      }
    ])
  ],
  providers: [
    AnswerService,
    AuthService,
    ExamService,
    QuestionService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
