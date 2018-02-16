const express = require('express');
const path = require('path');
const bodyParser= require('body-parser');
const cors= require('cors');
const passport= require('passport');



const app= express();

const routes= require('./routes/index')

const port= 3000;

app.use(cors());

app.use(express.static(path.join(__dirname, 'public')));

app.use(bodyParser.json());

app.use('/', routes);

app.listen(port, then =>{

	console.log("Listening...")
})