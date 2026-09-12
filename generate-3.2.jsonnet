local generate = import 'generate.jsonnet';
function(schema)
  generate(
    schema, |||
      + {
      ref: {
        ref(path): {'$ref': path},
        schema(path): {'$ref': '#/components/schemas/' + path},
        parameter(path): {'$ref': '#/components/parameters/' + path},
        response(path): {'$ref': '#/components/responses/' + path},
        example(path): {'$ref': '#/components/examples/' + path},
        requestBody(path): {'$ref': '#/components/requestBodies/' + path},
        header(path): {'$ref': '#/components/headers/' + path},
        mediaType(path): {'$ref': '#/components/mediaTypes/' + path},
        securityScheme(path): {'$ref': '#/components/securitySchemes/' + path},
        link(path): {'$ref': '#/components/links/' + path},
        callback(path): {'$ref': '#/components/callbacks/' + path},
        pathItem(path): {'$ref': '#/components/pathItems/' + path},
      },
      }
    |||
  )
