const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const studentController= require(`../controller/student.controller`);


// ----------------------------- Middlewares -------------------------------------

const tokenValidation = require(`../helper/middleware/auth`);


// ----------------------------- Routes ------------------------------------------

router.post(`/createStudent`,tokenValidation,studentController.postCreateUser);

module.exports = router;
