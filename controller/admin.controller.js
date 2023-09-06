const adminService = require("../services/admin.service");
const authHelper = require("../helper/functions/authHelper");


// ----------------------- Create Mentor Profile -----------------------------------------


exports.postCreateAdminProfile =async (req,res,next) =>{

    let {admin_name,email_address,password} = req.body;

    if(!admin_name || !email_address || !password)
    {
        return next({ statusCode: 400, message: `Please Send Proper Data With Proper Keys. (Required fields with keys - admin_name, email_address, password)` });
    }

    let isAdminExists =await adminService.getAdminByEmailId(email_address);


    console.log(isAdminExists);

    if(isAdminExists) 
    {
        return next({ statusCode: 409, message: `Admin already exists with given Email_Address` }); 
    }

    password =await authHelper.hashPassword(password);

    const createAdminResponse = await adminService.createAdmin({admin_name,email_address,password});

    return res.status(200).send({
        msg : "Admin Created Successfully!!",
        studentResponse :  createAdminResponse
    })

}
