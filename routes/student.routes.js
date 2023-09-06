const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const studentController= require(`../controller/student.controller`);




// ----------------------------- Middlewares -------------------------------------



router.post(`/createStudent`,studentController.postCreateUser);

module.exports = router;
