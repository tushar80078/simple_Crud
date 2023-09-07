const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const courseController= require(`../controller/course.controller`);



// ----------------------------- Middlewares -------------------------------------

const tokenValidation = require(`../helper/middleware/auth`);


// ----------------------------- Routes ------------------------------------------

router.post("/createCourse",tokenValidation,courseController.postCreateCourseController);


// ----------------------------- Module Exports ----------------------------------

module.exports = router;
