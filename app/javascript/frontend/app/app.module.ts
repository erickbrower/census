import { BrowserModule } from '@angular/platform-browser';
import { HttpModule } from '@angular/http';
import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router'

import { AppComponent } from './app.component';
import { ExamComponent } from './exam.component';
import { ExamListComponent } from './exam-list.component';
import { NavbarComponent } from './navbar.component';

import { ExamService } from './services/exam.service';

@NgModule({
  declarations: [
    AppComponent,
    ExamComponent,
    ExamListComponent,
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
  providers: [ExamService],
  bootstrap: [AppComponent]
})
export class AppModule { }
