const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

// getProduct by id
const getProductById = async (productId) => {
  const product = await prisma.products.findUnique({
    where: { id: productId },
  });
  return product;
};

// Get all products
const getAllProducts = async () => {
  const products = await prisma.products.findMany();
  return products;
};

// Edit product
const editProduct = async (productId, newData) => {
  const updatedProduct = await prisma.products.update({
    where: { id: productId },
    data: newData,
  });
  return updatedProduct;
};

// Delete product by id
const deleteProductById = async (productId) => {
  const deletedProduct = await prisma.products.delete({
    where: { id: productId },
  });
  return deletedProduct;
};

// Create product
const createProduct = async (productData) => {
  const newProduct = await prisma.products.create({
    data: productData,
  });
  return newProduct;
};

module.exports = {
  getProductById,
  getAllProducts,
  editProduct,
  deleteProductById,
  createProduct,
};
