const express = require("express");
const router = express.Router();


// ------------------- Import all routes from other routes file -------------------

const studentRoutes = require("./student.routes");
const adminRoutes = require("./admin.routes");
const courseRoutes = require("./course.routes");
const skillRoutes = require("./skill.routes");
const mentorRoutes = require("./mentor.routes");
const projectRoutes = require("./project.routes");
const residenciesRoutes = require("./residency.routes");
const sessionsRoutes = require("./session.routes")


// -------------------- Define Parent Routes ----------------------------------------

router.use("/student",studentRoutes);
router.use("/admin",adminRoutes);
router.use("/courses",courseRoutes);
router.use("/skills",skillRoutes);
router.use("/mentors",mentorRoutes);
router.use("/projects",projectRoutes);
router.use("/residencies",residenciesRoutes);
router.use("/sessions",sessionsRoutes);

module.exports = router;
