const config = require(`../helper/config/config`);

const studentDoc = require(`./content/student.doc`);
const adminDoc = require(`./content/admin.doc`)



// ---------------------- Swagger --------------------------

module.exports ={
    swagger : "2.0",
    ifno :{
        version : "1.0.0",
        title : "Makers Asylum Application",
        description : "Learning Management System Application's API",
        licenece :{
            name :"MIT",
            url: "https://opensource.org/licenses/MIT"
        }
    },
    host : config.SWAGGERPORT,
    basePath : "/",
    schemes : [`http`],
    consumes : [`application/json`],
    produces : [`application/json`],
    tages: [
        //Optional
    ],

    // -------- Security definations ---------------
    securityDefinitions : {
        JWT : {
            type : "apiKey",
            name : "Authorization",
            in :"header"
        }
    },


    // ----------- Definations -----------------------

    defination : {
        ...studentDoc.defination,
        ...adminDoc.defination
    },

    // ----------- Pahts ------------------------------
    paths : {
        ...studentDoc.path,
        ...adminDoc.path   
    }
};