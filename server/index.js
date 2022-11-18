const express = require('express');
const mongoose = require("mongoose");
const app = express();


const authRouter = require("./routes/auth");


var bodyParser = require('body-parser');
var urlencodedParser = bodyParser.urlencoded({ extended: false })

const PORT = process.env.PORT || 3000;
const DB =
  "";

app.use(express.json());
app.use(authRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});