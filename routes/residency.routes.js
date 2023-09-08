const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const residencyController= require(`../controller/residencies.controller`);



// ----------------------------- Middlewares -------------------------------------

const tokenValidation = require(`../helper/middleware/auth`);


// ----------------------------- Routes ------------------------------------------

router.post("/createResidency",tokenValidation,residencyController.postCreateResidency);


// ----------------------------- Module Exports ----------------------------------

module.exports = router;
