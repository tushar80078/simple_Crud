const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const projectController= require(`../controller/project.controller`);



// ----------------------------- Middlewares -------------------------------------

const tokenValidation = require(`../helper/middleware/auth`);


// ----------------------------- Routes ------------------------------------------

router.post("/createProject",tokenValidation,projectController.postCreateProject);


// ----------------------------- Module Exports ----------------------------------

module.exports = router;
