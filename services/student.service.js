const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();



//-------------------------  Create Student Profile ---------------------------------------- 


const createUser =async(studentData)=>{
    const newStudentResponse = await prisma.students.create({
        data:studentData
    })  
    
    return newStudentResponse;
}


//-------------------------  Get Student Profile ---------------------------------------- 


const getStudentByEmail_Id = async(studentData)=>{
    const newStudentResponse = await prisma.students.findFirst({
        where:{
                email_address:studentData
        }
    })
    return newStudentResponse;
}

module.exports={
    createUser,
    getStudentByEmail_Id
}