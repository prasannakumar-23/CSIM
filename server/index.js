const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors=require("cors");
const mongoose =require("mongoose");

const adminLoginRoute =require("./routes/adminLogin.js");

mongoose
  .connect(
    "mongodb+srv://user:1234@csimcluster.fw8ljl0.mongodb.net/?retryWrites=true&w=majority",
    (err, db) => {
      if (err) throw err;
//      var dB = db.useDb("CSIM");
//      dB.collection("coldstorageowners").findOne({}, function (err, result) {
//        if (err) throw err;
//        console.log(result);
//      });
      // console.log(dB.intl_admcourses.find());
    }
  )
  .then(console.log("connected to mongoDB"))
  .catch((err) => console.log(err));

var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false })

let messagejson = {message: 'Hello World'};
app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

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