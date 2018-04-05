const express = require('express');
const path = require('path');
const bodyParser= require('body-parser');
const cors= require('cors');
const passport= require('passport');



const app= express();

const routes= require('./routes/index')

var port = process.env.PORT || 8080;

app.use(cors());

app.use(express.static(path.join(__dirname, 'angular-src', 'dist')));

app.use(bodyParser.json());

app.use(passport.initialize());
app.use(passport.session());

app.use('/', routes);

app.listen(port, then =>{

	console.log("Listening...")
})