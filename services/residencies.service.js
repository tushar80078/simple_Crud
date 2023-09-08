const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();

//-------------------------  Create Residency ---------------------------------------- 

const createResidency =async(resData) =>{
    const residencyResponse = await prisma.residencies.create({
        data:resData
    })

    return residencyResponse;
}


//-------------------------  Get Residency By Name ---------------------------------------- 

const getResidencyByName = async(resData) =>{
    const residencyResponse = await prisma.residencies.findFirst({
        where:{
            title : resData
        }
    })

    return residencyResponse;
}




//--------------------------- Module Exports -------------------------------------

module.exports={
    createResidency,
    getResidencyByName
}


