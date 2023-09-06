const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();



//-------------------------  Create Admin Profile ---------------------------------------- 

const createAdmin = async(adminData) =>{
    const adminResponse = await prisma.admin_account.create({
        data:adminData
    });

    return adminResponse;
}


//-------------------------  Get Admin ByEmailID ---------------------------------------- 

const getAdminByEmailId = async(adminData) =>{
    const adminResponse = await prisma.admin_account.findFirst({
        where:{
            email_address : adminData
        }
    });
    
    return adminResponse;
}

//--------------------------- Module Exports -------------------------------------


module.exports={
    createAdmin,
    getAdminByEmailId
}
