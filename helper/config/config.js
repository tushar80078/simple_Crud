module.exports={
    PORT : process.env.PORT || 8888,
    SWAGGERPORT: process.env.PORT || "localhost:8888",
  
  
    //--------------------- JWT Auth Key -----------------
    auth: {
        secret: "our-secret-key",
    },
}