const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();



/**
 * Create Student Profile
 */

const createUser =async(studentData)=>{
    const newStudentResponse = await prisma.students.create({
        data:studentData
    })  
    
    return newStudentResponse;
}


module.exports={
    createUser
}