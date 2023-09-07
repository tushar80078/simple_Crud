const courseService = require("../services/courses.service");
const authHelper = require("../helper/functions/authHelper");


// --------------------------------- Create Course -----------------------------------------


exports.postCreateCourseController=async(req,res,next)=>{
    try 
    {        
        const courseData = req.body;

        if(!courseData.name || !courseData.fees)
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - name, fees)` });
        }

        const isCourseExists = await courseService.getCourseByName(courseData.name);

        if(isCourseExists)
        {
            return next({ statusCode: 409, message: `Course already exists with name`}); 
        }

        const createCourseResponse = await courseService.createCourse(courseData);

        if(createCourseResponse)
        {
            return res.status(200).send({
                msg : "Course Created Successfully!!",
                studentResponse :  createCourseResponse
            }) 
        }else{
            return next(`Error While Creating Course`);
        }

        
    } catch (error) {
        return next(error);
    }   

}
