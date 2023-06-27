console.log('Hello World!');

//Import external libraries
const express = require('express');
const mongoose = require('mongoose');

//Import local files
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');


//Init variables
const PORT = 3000;
const app = express();

//Middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//Connections database
const DB = "mongodb+srv://hhugoac:Guadalajara2023@cluster0.5wbuocy.mongodb.net/"

mongoose
.connect(DB)
.then(() => {
    console.log('Connection successful');
}).catch((e) => {
    console.log(e);
});

//Create an API
app.get('/hello-world', (req, res) => {
    res.json({hi: "hello world "});
});

//Create an API
app.get('/my-name', (req, res) => {
    res.json({name: "Hugo"});
});

app.listen(PORT, '0.0.0.0', ()=>{
    console.log('connected to port ' + PORT);    
});