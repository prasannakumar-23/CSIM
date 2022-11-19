const router=require("express").Router();
const User = require("../models/coldstorage.js");

router.get("/", async(req, res)=>{
    try{
        curItem = await User.find();
        res.send(curItem);
    }catch(err){
        res.status(500);
        res.send("err");
    }
});

module.exports = router;