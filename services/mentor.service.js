const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();



/**
 * Create Mentor Profile
 */

const createMentor = async(empData) =>{
    const mentorResponse = await prisma.mentors(empData);

    return mentorResponse;
}


// ---------------------- Module Exports -------------------------

module.exports={
    createMentor
}
