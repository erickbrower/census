import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-navbar',
  template: `
  <nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">Census</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a [routerLink]="['/']">Home</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#">New Exam</a></li>
        </ul>
      </div>
    </div>
  </nav>
  `
})
export class NavbarComponent implements OnInit {
  ngOnInit() {

  }
}
