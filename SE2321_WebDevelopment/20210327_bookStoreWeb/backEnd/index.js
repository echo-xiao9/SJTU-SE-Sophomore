const express = require('express');
const app = express();
const mysql = require('mysql')

const db = mysql.createPool({
  host:"localhost",
  user:"root",
  password:"password",
  database:"movieDataBase"
});

// if someone go to the home then send the string
// req:require res:response
app.get("/", (req, res) => {
  const sqlInsert = "INSERT INTO movie_reviews (movieName, movieReview) VALUES ('inception','good movie');"
  db.query(sqlInsert,(err,result)=> {
    res.send("hello kqq");
  })
  // res.send("hello kqq");
  
});

app.listen(3001, ()=>{
  console.log("running on port 3001");
});