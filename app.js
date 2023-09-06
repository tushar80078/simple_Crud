const express = require("express");
const app = express();
const cors = require("cors");
const swaggerUi = require("swagger-ui-express");


app.use(express.json());
app.use(cors());

// ------------ Import from other file ---------------------

const errorMiddleware = require("./helper/middleware/errorMiddleware");
const routes = require("./routes/allRoutes.routes");
const swaggerDoc = require("./documentation/swagger");

// --------------- Swagger Route ---------------------------
app.use("/swagger",swaggerUi.serve, swaggerUi.setup(swaggerDoc));

// --------------- Test Route ------------------------------
app.use("/test", function (req, res, next) {
    res.send(
        `<html><body><h1>Server Started</h1></body></html>`
    );
});

// ------------ All Parent Routes ---------------------
app.use("/",routes);



app.use(errorMiddleware);

module.exports=app;
