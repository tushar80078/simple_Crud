const projectService = require("../services/project.service");
const authHelper = require("../helper/functions/authHelper");
const dateTimeGenerator = require("../helper/functions/timeDateGenerator");


// --------------------------------- Create Project -----------------------------------------



exports.postCreateProject =async(req,res,next)=>{
    try {
        
        const projectData = req.body;
   
        if(!projectData.title || !projectData.isMandatory.toString() || !projectData.projectFor || !projectData.allocation_time_period || !projectData.publish.toString())
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - title,isMandatory,projectFor,allocation_time_period,publish)` });
        }

        const isProjectExists = await projectService.getProjectByName(projectData.title);

        if(isProjectExists)
        {
            return next({ statusCode: 409, message: `Project already exists with name`}); 
        }

        //------- Generate current time to add in database
        const created_at = dateTimeGenerator.generateCurrentTiimeDate();     

        const createProjectResonse = await projectService.createProject({created_at,...projectData});

        if(createProjectResonse)
        {
            return res.status(200).send({
                msg : "Project Created Successfully!!",
                porjectResponse :  createProjectResonse
            }) 
        }else{
            return next(`Error While Creating Project`);
        }

    } catch (error) {
        return next(error);
    }
}


