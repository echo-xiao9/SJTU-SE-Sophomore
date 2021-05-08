const express = require('express');
const app = express();



// if someone go to the home then send the string
// req:require res:response
app.get("/", (req, res) => {
  res.send("hello kqq");
});

app.listen(3001, ()=>{
  console.log("running on port 3001");
});