const express = require(`express`);
const router = express.Router();


// ----------------------------- Controller -------------------------------------

const adminController= require(`../controller/admin.controller`);





// ----------------------------- Middlewares -------------------------------------




// ----------------------------- Routes ------------------------------------------

router.post("/createAdmin",adminController.postCreateAdminProfile);
router.post("/loginAdmin",adminController.postAdminLogin);

// ----------------------------- Module Exports ----------------------------------

module.exports = router;
