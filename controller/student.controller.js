const studentService = require("../services/student.service");
const authHelper = require("../helper/functions/authHelper");



// ----------------------- Create Student Profile -----------------------------------------

exports.postCreateUser = async(req,res,next) =>{
    try {
    
        let {firstname, email_address, password} = req.body;

        if(!firstname || !email_address || !password)
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - firstname, emailaddress, password)` });
        }

        // ----------- Generating hash password ---------------------
        password = await authHelper.hashPassword(password);

        const response = await studentService.createUser({...req.body,password});

        return res.status(200).send({
            msg : "Student Created Successfully!!",
            studentResponse :  response
        })
        
    } catch (error) {
        return next(error);
    }
}