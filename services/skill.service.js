const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();


//-------------------------  Create Skill ---------------------------------------- 

const createSkill = async(skillData) =>{
    const skillResponse = await prisma.skills.create({
        data:skillData
    });

    return skillResponse;
}

//-------------------------  Get Course Profile ---------------------------------------- 

const getSkillByName = async(skillData) =>{
    const skillResponse = await prisma.skills.findFirst({
        where:{
            name : skillData
        }
    })

    return skillResponse;
}




//--------------------------- Module Exports -------------------------------------

module.exports={
    createSkill,
    getSkillByName
}





