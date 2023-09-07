const express = require("express");
const router = express.Router();


// ------------------- Import all routes from other routes file -------------------

const studentRoutes = require("./student.routes");
const adminRoutes = require("./admin.routes");
const courseRoutes = require("./course.routes");

router.use("/student",studentRoutes);
router.use("/admin",adminRoutes);
router.use("/courses",courseRoutes);


module.exports = router;
