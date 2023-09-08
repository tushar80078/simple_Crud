// ------------------ Swagger Definition ------------------

exports.defination = {


    // ----------- Create Course Request Starts --------------------
    createCourseRequest : {
      required: ["name", "fees", "course_description","course_score","has_project","has_residency","couse_image_link","publish"],
      properties: {
        name: {
          type: "string",
          example: "Frontend In React",
        },
        fees: {
          type: "decimal",
          example: 12000.20,
        },
        course_description: {
          type: "string",
          example: "Best Course For Begginners",
        },
        course_score: {
            type: "decimal",
            example: 0 ,
        },
        has_project: {
            type: "Boolean",
            example: true,
        },
        has_residency:{
            type: "Boolean",
            example: false,
        },
        couse_image_link:{
            type: "string",
            example: "course_image_link",
        },
        publish:{
          type:"boolean",
          example : "false"
        }
      },
      securityDefinitions: {
        JWT: {
          type: "apiKey",
          name: "Authorization",
          in: "header",
        },
      },
    },//=> Create Course Request Ends

   
 
};
  
  // ------------------- Swagger Paths -------------------------------
  
  exports.path = {

     // ----------- Create Course Request Starts --------------------
    "/courses/createCourse": {
      post: {
        tags: ["Courses"],
        operationId: "createCourse",
        summary: "Add Course",
        description: "Add Course",
        security: [{ JWT: [] }],
        parameters: [
          {
            name: "course",
            required: true,
            in: "body",
            type: "object",
            description: "Course Information.",
            schema: {
              $ref: "#/defination/createCourseRequest",
            },
          },
        ],
        responses: {
          200: {
            description: "New Course Created Successfully!!!",
            schema: {
              // Not cleared yet
            },
          },
        },
      },
    },//=> Create Course Request Ends

  
  };
  