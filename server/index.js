const express = require('express');
const app = express();
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const cors=require("cors");

const adminLoginRoute = require("./routes/adminLogin.js");
const adminSignupRoute = require("./routes/adminSignup.js");

app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

mongoose
   .connect('mongodb+srv://user:1234@csimcluster.fw8ljl0.mongodb.net/?retryWrites=true&w=majority')
   .then(() => {
     console.log("Connection Successful");
   })
   .catch((e) => {
     console.log(e);
   });

app.use("/admin/login", adminLoginRoute);
app.use("/admin/signup", adminSignupRoute);

app.listen(3000, () => {
    console.log("server running...");
});