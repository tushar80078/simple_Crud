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
