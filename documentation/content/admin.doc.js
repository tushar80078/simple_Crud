// ------------------ Swagger Definition ------------------

exports.defination = {
    createAdminRequest: {
      required: ["admin_name", "email_address", "password"],
      properties: {
        admin_name: {
          type: "string",
          example: "John Admin",
        },
        email_address: {
          type: "string",
          example: "john_admin@example.com",
        },
        password: {
          type: "string",
          example: "Abc12345*",
        },
      },
    },
  };
  
  // ------------------- Swagger Paths -------------------------------
  
  exports.path = {
    "/admin/createAdmin": {
      post: {
        tags: ["Admin"],
        operationId: "createAdmin",
        summary: "Add Admin",
        description: "Add Admin",
        security: [{ JWT: [] }],
        parameters: [
          {
            name: "admin",
            required: true,
            in: "body",
            type: "object",
            description: "Admin Information.",
            schema: {
              $ref: "#/defination/createAdminRequest",
            },
          },
        ],
        responses: {
          200: {
            description: "New Admin Created Successfully!!!",
            schema: {
              // Not cleared yet
            },
          },
        },
      },
    },
  };
  