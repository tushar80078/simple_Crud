const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();



//-------------------------  Create Student Profile ---------------------------------------- 

const createMentor = async(empData) =>{
    const mentorResponse = await prisma.mentors.create({
        data:empData
    });

    return mentorResponse;
}


//-------------------------  Get Student Profile ---------------------------------------- 

const getMentorByEmailId = async(empdata) =>{
    const mentorResponse = await prisma.mentors.findFirst({
        where:{
            email_address: empdata
        }
    })
}


// ---------------------- Module Exports -------------------------

module.exports={
    createMentor,
    getMentorByEmailId
}
