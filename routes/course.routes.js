const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const courseController= require(`../controller/course.controller`);



// ----------------------------- Middlewares -------------------------------------

const tokenValidation = require(`../helper/middleware/auth`);


// ----------------------------- Routes ------------------------------------------

router.post("/createCourse",tokenValidation,courseController.postCreateCourseController);
router.get("/getAllCourses",tokenValidation,courseController.getGetAllCourses);
router.put("/updateCourseById/:id",tokenValidation,courseController.putUpdateCourseById);
router.delete("/deleteCourseById/:id",tokenValidation,courseController.deleteDeleteCourseById);

// ----------------------------- Module Exports ----------------------------------

module.exports = router;
