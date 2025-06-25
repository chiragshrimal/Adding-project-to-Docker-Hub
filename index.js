const express= require("express");

const app=express();

app.get("/",(req,res)=>{
    res.send("hello world123454fefewgfnfnadsjgkndjkgnlewjkng");
})

app.listen(3000);
console.log(process.env.DATABASE_URL);