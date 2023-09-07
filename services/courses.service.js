const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();


//-------------------------  Create Admin Profile ---------------------------------------- 

const createCourse = async(courseData) =>{
    const courseResponse = await prisma.courses.create({
        data:courseData
    });

    return courseResponse;
}

//-------------------------  Get Course Profile ---------------------------------------- 

const getCourseByName = async(courseData) =>{
    const courseResponse = await prisma.courses.findFirst({
        where:{
            name : courseData
        }
    })

    return courseResponse;
}




//--------------------------- Module Exports -------------------------------------

module.exports={
    createCourse,
    getCourseByName
}





