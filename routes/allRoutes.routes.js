const express = require("express");
const router = express.Router();

// ------------------- Import all routes from other routes file -------------------

const productRoutes = require("./product.routes");

// -------------------- Define Parent Routes ----------------------------------------

router.use("/product", productRoutes);

module.exports = router;
