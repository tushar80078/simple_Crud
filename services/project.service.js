const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();

//-------------------------  Create Project ---------------------------------------- 

const createProject =async(porjectData) =>{
    const projectResponse = await prisma.projects.create({
        data:porjectData
    })

    return projectResponse;
}


//-------------------------  Get Project By Name ---------------------------------------- 

const getProjectByName = async(projectData) =>{
    const projectResponse = await prisma.projects.findFirst({
        where:{
            title : projectData
        }
    })

    return projectResponse;
}




//--------------------------- Module Exports -------------------------------------

module.exports={
    getProjectByName,
    createProject
}


