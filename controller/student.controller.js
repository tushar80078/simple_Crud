const studentService = require("../services/student.service");
const authHelper = require("../helper/functions/authHelper");
const dateTimeGenerator = require("../helper/functions/timeDateGenerator");


// ----------------------- Create Student Profile -----------------------------------------

exports.postCreateUser = async(req,res,next) =>{
    try {
    
        let {firstname, email_address, password} = req.body;


        if(!firstname || !email_address || !password)
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - firstname, emailaddress, password)` });
        }

        const isStudentExist = await studentService.getStudentByEmail_Id(email_address);

        if(isStudentExist)
        {
            return next({ statusCode: 409, message: `Student already exists with given Email_Address` });    
        }

        // ----------- Generating hash password ---------------------
        password = await authHelper.hashPassword(password);

         //------- Generate current time to add in database
         const created_at = dateTimeGenerator.generateCurrentTiimeDate();

        const response = await studentService.createUser({...req.body,password,created_at});

        return res.status(200).send({
            msg : "Student Created Successfully!!",
            studentResponse :  response
        })
        
    } catch (error) {
        return next(error);
    }
}