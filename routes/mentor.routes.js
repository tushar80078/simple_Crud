const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const mentorController= require(`../controller/mentor.controller`);



// ----------------------------- Middlewares -------------------------------------

const tokenValidation = require(`../helper/middleware/auth`);


// ----------------------------- Routes ------------------------------------------

router.post("/createMentor",tokenValidation,mentorController.postCreateMentor);


// ----------------------------- Module Exports ----------------------------------

module.exports = router;
