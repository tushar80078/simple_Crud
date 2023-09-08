const residencyService = require("../services/residencies.service");
const authHelper = require("../helper/functions/authHelper");
const dateTimeGenerator = require("../helper/functions/timeDateGenerator");


// --------------------------------- Create Residency -----------------------------------------


exports.postCreateResidency =async(req,res,next)=>{
    try {
        
        const residencyData = req.body;
   
        if(!residencyData.residency_name || !residencyData.duration || !residencyData.isMandatory.toString() || !residencyData.publish.toString())
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - residency_name, duration, isMandatory, publish)` });
        }

        const isResidencyExists = await residencyService.getResidencyByName(residencyData.title);

        if(isResidencyExists)
        {
            return next({ statusCode: 409, message: `Residency already exists with name`}); 
        }

        //------- Generate current time to add in database
        const created_at = dateTimeGenerator.generateCurrentTiimeDate();     

        const createResidencyResponse = await residencyService.createResidency({created_at,...residencyData});

        if(createResidencyResponse)
        {
            return res.status(200).send({
                msg : "Residency Created Successfully!!",
                residencyResponse :  createResidencyResponse
            }) 
        }else{
            return next(`Error While Creating Resindecy`);
        }

    } catch (error) {
        return next(error);
    }
}


