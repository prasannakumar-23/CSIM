const router=require("express").Router();
const User = require("../models/coldstorage.js");
const bcrypt = require('bcrypt');
const bodyParser = require("body-parser");

router.get("/", async(req, res)=>{
    console.log("open");
    res.send("hello");
});

router.post("/",async(req,res)=>{
    try{
        const salt=await bcrypt.genSalt(10);
        console.log("hello");
        const hashedPass=await bcrypt.hash(req.body.password,salt); console.log(hashedPass)
        req.body.password = hashedPass;
        console.log("hello2");
        const newUser = new User(req.body);
        console.log("hello3");
        const user = await newUser.save();
        res.status(200);
        console.log(user);
        res.send(user);
    }catch(err){
        res.status(500);
        console.log(err);
        res.send(err);
    }
    }
);

module.exports=router