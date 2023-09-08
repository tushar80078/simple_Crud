const mentorService = require("../services/mentor.service");
const authHelper = require("../helper/functions/authHelper");
const dateTimeGenerator = require("../helper/functions/timeDateGenerator");
       


// ----------------------- Create Mentor Profile -----------------------------------------



exports.postCreateMentor = async(req,res,next) =>{
    try {
    
        let {first_name, email_address, password, mobile_no} = req.body;

        if(!first_name || !email_address || !password || !mobile_no)
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - first_name, email_address, password,mobile_no)` });
        }

        const isMentorExists = await mentorService.getMentorByEmailId(email_address);

        if(isMentorExists)
        {
            return next({ statusCode: 409, message: `Metor already exists with given Email_Address`}); 
        }        

        // ----------- Generating hash password ---------------------
        password = await authHelper.hashPassword(password);

        //------- Generate current time to add in database
        const created_at = dateTimeGenerator.generateCurrentTiimeDate(); 

        const response = await mentorService.createMentor({...req.body,password,created_at});

        return res.status(200).send({
            msg : "Mentor Created Successfully!!",
            response :  response
        })
        
    } catch (error) {
        return next(error);
    }
}
