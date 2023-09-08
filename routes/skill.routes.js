const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const skillController= require(`../controller/skill.controller`);



// ----------------------------- Middlewares -------------------------------------

const tokenValidation = require(`../helper/middleware/auth`);


// ----------------------------- Routes ------------------------------------------

router.post("/createSkill",tokenValidation,skillController.postCreateSkillController);


// ----------------------------- Module Exports ----------------------------------

module.exports = router;
