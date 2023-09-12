const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const sessionController= require(`../controller/sessions.controller`);



// ----------------------------- Middlewares -------------------------------------

const tokenValidation = require(`../helper/middleware/auth`);


// ----------------------------- Routes ------------------------------------------

router.post("/createRecordedSession",tokenValidation,sessionController.postCreateRecordedSession);
router.post("/createLiveSession",tokenValidation,sessionController.postCreateLiveSession);


// ----------------------------- Module Exports ----------------------------------

module.exports = router;
