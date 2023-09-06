const bcrypt = require("bcryptjs");


// ------------------------ Generate ash password by using bcryptjs --------------------------------------

const hashPassword = async (password) =>{
    let hashedPassword = await bcrypt.hash(password,12);
    return hashedPassword;
}

// ------------------------ Generate ash password by using bcryptjs --------------------------------------

const validatePassword = async (password,hashedPassword) =>{
    let isPasswordValid = await bcrypt.compare(password,hashedPassword);
    return isPasswordValid
}


// ------------------------ Module Exports --------------------------------------

module.exports={
    hashPassword,
    validatePassword
}