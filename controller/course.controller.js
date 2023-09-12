const courseService = require("../services/courses.service");
const authHelper = require("../helper/functions/authHelper");
const dateTimeGenerator=require("../helper/functions/timeDateGenerator");

// --------------------------------- Create Course -----------------------------------------


exports.postCreateCourseController=async(req,res,next)=>{
    try 
    {        
        const courseData = req.body;
        
        if(!courseData.name || !courseData.fees ||!courseData.publish.toString())
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - name, fees, publish)` });
        }

        const isCourseExists = await courseService.getCourseByName(courseData.name);

        if(isCourseExists)
        {
            return next({ statusCode: 409, message: `Course already exists with name`}); 
        }

         //------- Generate current time to add in database
         const created_at = dateTimeGenerator.generateCurrentTiimeDate();     

        const createCourseResponse = await courseService.createCourse({created_at,...courseData});

        if(createCourseResponse)
        {
            return res.status(200).send({
                msg : "Course Created Successfully!!",
                courseReponse :  createCourseResponse
            }); 
        }else{
            return next(`Error While Creating Course`);
        }
        
    } catch (error) {
        return next(error);
    }   

}


// --------------------------------- Get All Courses -----------------------------------------


exports.getGetAllCourses = async(req,res,next) =>{

    try {
        
        const getCourseResponse = await courseService.getAllCourses();

        if(getCourseResponse)
        {
            return res.status(200).send({
                msg : "Courses Fetched Successfully!!",
                courseReponse :  getCourseResponse
            }); 
        }else{
            return next(`Error While Getting Courses`);
        }

    } catch (error) {
        return next(error);
    }

}


// --------------------------------- Update Course By ID -----------------------------------------

exports.putUpdateCourseById = async(req,res,next) =>{
    try {
        
        const {id} = req.params;
        const courseData = req.body;

        if(!id)
        {
            return next({ statusCode: 400, message: `Course Id Not Found In Req Params Required (id)` });
        }

        const courseResponse = await courseService.updateCourseById(id,courseData);

        if(courseResponse)
        {
            return res.status(200).send({
                msg : "Course Updated Successfully !!!",
                courseResponse : courseResponse
            })
        }else{
            return next(`Error While Updating Course`);
        }

    } catch (error) {
        return next(error);
    }
}

// --------------------------------- Delete Course By ID -----------------------------------------

exports.deleteDeleteCourseById = async(req,res,next) =>{
    try {
        const {id} = req.params;

        if(!id)
        {
            return next({ statusCode: 400, message: `Course Id Not Found In Req Params Required (id)` });
        }

        const isCourseExists = await courseService.getCourseByCourseId(id);

        if(!isCourseExists)
        {
            return next({ statusCode: 409, message: `Course not found with given id. Please check.`}); 
        }

        const courseResponse = await courseService.deleteCourseById(id);

        if(courseResponse)
        {
            return res.status(200).send({
                msg : "Course Deleted Successfully !!!",
                courseResponse : courseResponse
            })
        }else{
            return next(`Error While Deleting Course`);
        }


    } catch (error) {
        return next(error);
    }
}