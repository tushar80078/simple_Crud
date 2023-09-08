const skillService = require("../services/skill.service");
const authHelper = require("../helper/functions/authHelper");
const dateTimeGenerator = require("../helper/functions/timeDateGenerator");


// --------------------------------- Create Course -----------------------------------------



exports.postCreateSkillController=async(req,res,next)=>{
    try 
    {        
        const skillData = req.body;

        if(!skillData.name || !skillData.publish.toString())
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - name,publish)` });
        }

        const isSkillExists = await skillService.getSkillByName(skillData.name);

        if(isSkillExists)
        {
            return next({ statusCode: 409, message: `Skill already exists with name`}); 
        }

        //------- Generate current time to add in database
        const created_at = dateTimeGenerator.generateCurrentTiimeDate();     

        const createSkillResponse = await skillService.createSkill({created_at,...skillData});

        if(createSkillResponse)
        {
            return res.status(200).send({
                msg : "Skill Created Successfully!!",
                skillResponse :  createSkillResponse
            }) 
        }else{
            return next(`Error While Creating Skill`);
        }

        
    } catch (error) {
        return next(error);
    }   

}
