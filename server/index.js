const express = require('express');
const app = express();

var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false })

let messagejson = {message: 'Hello World'};
app.use(express.json());

app.get('/message', (req, res) => {
    res.send(messagejson)
});

app.post('/login', (req, res) => {
    response = {
       username:req.body.username,
       password3:req.body.password
    };
    console.log(response);
    res.send(JSON.stringify(response));
});

app.listen(3000, () => {
    console.log("server running...");
});