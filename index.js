require("dotenv").config();
const {PrismaClient} =require("@prisma/client")
const prisma=new PrismaClient()


// ----------------------------- Import from another files -------------------------------------------

const config = require("./helper/config/config");
const app = require("./app");


// prisma.$connect().then(data=>{

// }).catch(err=>{
//     console.log(err);
// })



app.listen(config.PORT,(err)=>{
    if(!err)
    {
        console.log(`Server started on port : ${config.PORT}\nCtr + Click to start http://localhost:8888/test`)
    }else{
        console.log(`Error while starting server.\n Error : - ${err}`)
    }
})