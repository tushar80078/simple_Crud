const productService = require("../services/product.service");

// ----------------------- Get All Products -----------------------------------------

exports.getAllProducts = async (req, res, next) => {
  try {
    const productsResponse = await productService.getAllProducts();
    return res.status(200).send({
      success: true,
      msg: "Product Fetched Successfully!!",
      products: productsResponse,
    });
  } catch (error) {
    next(error);
  }
};

// ----------------------- Get Product By Id -----------------------------------------

exports.getProductById = async (req, res, next) => {
  try {
    const productId = parseInt(req.params.id);
    const productsResponse = await productService.getProductById(productId);
    if (!productsResponse) {
      return res
        .status(404)
        .json({ message: "Product not found for given id", success: false });
    }
    return res.status(200).send({
      success: true,
      msg: "Product Fetched Successfully!!",
      product: productsResponse,
    });
  } catch (error) {
    next(error);
  }
};

// ----------------------- Create Product -----------------------------------------

exports.createProduct = async (req, res, next) => {
  try {
    const productData = req.body;
    const productsResponse = await productService.createProduct(productData);
    return res.status(200).send({
      success: true,
      msg: "Product Created Successfully!!",
      product: productsResponse,
    });
  } catch (error) {
    next(error);
  }
};

// ----------------------- Update Product -----------------------------------------

exports.updateProduct = async (req, res, next) => {
  try {
    const productId = parseInt(req.params.id);
    const newData = req.body;
    const productsResponse = await productService.editProduct(
      productId,
      newData
    );
    return res.status(200).send({
      success: true,
      msg: "Product updated Successfully!!",
      product: productsResponse,
    });
  } catch (error) {
    next(error);
  }
};

// ----------------------- Delete Product By Id -----------------------------------------

exports.deleteProductById = async (req, res, next) => {
  try {
    const productId = parseInt(req.params.id);
    const productsResponse = await productService.deleteProductById(productId);
    return res.status(200).send({
      success: true,
      msg: "Product deleted Successfully!!",
      product: productsResponse,
    });
  } catch (error) {
    next(error);
  }
};
