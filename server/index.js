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
   .connect('mongodb+srv://user:1234@csimcluster.fw8ljl0.mongodb.net/csim?retryWrites=true&w=majority')
   .then(() => {
     console.log("Connection Successful");
   })
   .catch((e) => {
     console.log(e);
   });

app.use("/admin/login", adminLoginRoute);
//app.use("/admin/signup", adminSignupRoute);

app.post("/admin/signup",async(req,res)=>{
        try{
            const salt=await bcrypt.genSalt(10);
            console.log("hello");
            const hashedPass=await bcrypt.hash(req.body.password,salt);
            req.body.password = hashedPass;
            const newUser = new User(req.body);
            const user = await newUser.save();
            res.status(200);
            console.log(user);
            res.send(user);
        }catch(err){
            res.status(500);
            res.send("err");
        }
        }
    );

app.listen(3000, () => {
    console.log("server running...");
});