const mongoose = require("mongoose");

const AdminSchema= mongoose.Schema({
    storagename:{
        type: String,
        required:true
    },
    storageid:{
        type: String, // storage name, owner name, owner contact number, email, password, storage id(send through email/govt registered id),
        required:true,
        unique: true
    },
    ownername:{
        type: String,
        required:true
    },
    ownercontact:{
        type: String,
        required: true,
        unique: true
    },
    email:{
        type: String,
        required: true,
        unique: true
    },
    password:{
        type: String,
        required:true
    }

},{timestamps:true})

const UserModel = mongoose.model("coldstorageowner", AdminSchema);
module.exports = UserModel;