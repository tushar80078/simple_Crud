const adminService = require("../services/admin.service");
const authHelper = require("../helper/functions/authHelper");
const dateTimeGenerator = require("../helper/functions/timeDateGenerator")

// ----------------------- Create Mentor Profile -----------------------------------------


exports.postCreateAdminProfile =async (req,res,next) =>{
    try {

        let {admin_name,email_address,password} = req.body;

        if(!admin_name || !email_address || !password)
        {
            return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - admin_name, email_address, password)` });
        }
    
        let isAdminExists =await adminService.getAdminByEmailId(email_address);
    
        if(isAdminExists) 
        {
            return next({ statusCode: 409, message: `Admin already exists with given Email_Address` }); 
        }
    
        //------- Generating hash password
        password =await authHelper.hashPassword(password);

        //------- Generate current time to add in database
        const created_at = dateTimeGenerator.generateCurrentTiimeDate();
    
        const createAdminResponse = await adminService.createAdmin({admin_name,email_address,password,created_at});
    
        return res.status(200).send({
            msg : "Admin Created Successfully!!",
            adminResponse :  createAdminResponse
        })
            
    } catch (error) {
        return next(error);
    }

}



// ----------------------- Admin Authentication -----------------------------------------

exports.postAdminLogin=async(req,res,next) =>{

    try {
            const {email_address,password} = req.body;

            if(!email_address || !password)
            {
                return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - email_address, password)` });
            }

            let isAdminExists =await adminService.getAdminByEmailId(email_address);

            if(!isAdminExists) 
            {
                return next({ statusCode: 409, message: `Admin not found with given Email_Address` }); 
            }

            let validatePassword = await authHelper.validatePassword(password,isAdminExists.password);

            

            if(validatePassword)
            {
                const tokenObject = {id:isAdminExists.id,email_address : isAdminExists.email_address};
                const jwtToken = await authHelper.createToken(tokenObject);
                return res.status(200).send({
                    msg : "Admin Successfully Logged In!!",
                    token : jwtToken,
                    adminInfo : {
                        email_address : isAdminExists.email_address,
                        name : isAdminExists.admin_name
                    }
                    });   
            }else{
                return res.status(401).send({
                    msg : "You Are Not Authorized!! Password Incorrect"});   
            }
   
    } catch (error) {
        return next(error);
    }
}

