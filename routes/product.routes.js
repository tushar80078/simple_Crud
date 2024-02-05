const express = require(`express`);
const router = express.Router();

// ----------------------------- Controller -------------------------------------

const productController = require(`../controller/product.controller`);

// ----------------------------- Middlewares -------------------------------------

// ----------------------------- Routes ------------------------------------------

router.post("/createProduct", productController.createProduct);
router.get("/getAllProduct", productController.getAllProducts);
router.delete("/deleteProductById/:id", productController.deleteProductById);
router.get("/getProductById/:id", productController.getProductById);
router.put("/updateProduct/:id", productController.updateProduct);

// ----------------------------- Module Exports ----------------------------------

module.exports = router;
