const {PrismaClient} = require("@prisma/client");
const prisma = new PrismaClient();


//-------------------------  Create Course ---------------------------------------- 

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


//-------------------------  Get All Courses ---------------------------------------- 

const getAllCourses = async () =>{
    const courseResponse = await prisma.courses.findMany();

    return courseResponse;
}


//-------------------------  Get Courses By Id ---------------------------------------- 

const getCourseByCourseId = async (courseId)=>{
    if(typeof courseId != Number)
    {
        courseId = parseInt(courseId);
    }

    const courseResponse = await prisma.courses.findFirst({
        where:{
            id:courseId
        }
    })

    return courseResponse;
}

//-------------------------  Update Course By ID---------------------------------------- 

const updateCourseById = async (courseId,courseData) =>{

    if(typeof courseId != Number)
    {
        courseId = parseInt(courseId);
    }

    const existingData = await getCourseByCourseId(courseId);

    if(!existingData)
    {
        throw new Error("Course With Given Id Not Found")
    }

    courseData = {...existingData,...courseData};

    const courseResponse = await prisma.courses.update({
        where:{
            id:courseId
        },
        data:courseData
    })

    return courseResponse;
}

//-------------------------  Delete Course By ID---------------------------------------- 

const deleteCourseById = async (courseId) =>{
    if(typeof courseId != Number)
    {
        courseId = parseInt(courseId);
    }

    const courseResponse = await prisma.courses.delete({
        where:{
            id:courseId
        }
    })

    return courseResponse;
}

//--------------------------- Module Exports -------------------------------------

module.exports={
    createCourse,
    getCourseByName,
    getAllCourses,
    updateCourseById,
    deleteCourseById,
    getCourseByCourseId
}





