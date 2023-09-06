const mentorService = require("../services/mentor.service");
const authHelper = require("../helper/functions/authHelper");



// ----------------------- Create Mentor Profile -----------------------------------------

/*
model mentors {
  id                    Int              @id @default(autoincrement())
  first_name            String           @db.VarChar(255)
  last_name             String           @db.VarChar(255)
  experience_level      String           @db.VarChar(50)
  email_address         String           @db.VarChar(50)
  mobile_no             String           @db.VarChar(50)
  dob                   DateTime?        @db.Date
  password              String           @db.VarChar(20)
  skills_specialization String?          @db.VarChar(255)
  education             String?          @db.VarChar(255)
  mentors_skills        mentors_skills[]
  mentors_slot          mentors_slot[]
}

*/

exports.postCreateMentor = async(req,res,next) =>{
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