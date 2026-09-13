local generate = import 'generate.jsonnet';
function(schema)
  generate(
    schema, |||
      + {
      ref: {
        '#': { name: 'ref', help: 'OpenAPI 3.2 reusable component references.' },
        '#ref': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference from a complete JSON Reference path.' } },
        ref(path): {'$ref': path},
        '#schema': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 schema using a JSON Pointer subpath.' } },
        schema(path): {'$ref': '#/components/schemas/' + path},
        '#parameter': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 parameter using a JSON Pointer subpath.' } },
        parameter(path): {'$ref': '#/components/parameters/' + path},
        '#response': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 response using a JSON Pointer subpath.' } },
        response(path): {'$ref': '#/components/responses/' + path},
        '#example': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 example using a JSON Pointer subpath.' } },
        example(path): {'$ref': '#/components/examples/' + path},
        '#requestBody': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 request body using a JSON Pointer subpath.' } },
        requestBody(path): {'$ref': '#/components/requestBodies/' + path},
        '#header': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 header using a JSON Pointer subpath.' } },
        header(path): {'$ref': '#/components/headers/' + path},
        '#mediaType': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 media type using a JSON Pointer subpath.' } },
        mediaType(path): {'$ref': '#/components/mediaTypes/' + path},
        '#securityScheme': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 security scheme using a JSON Pointer subpath.' } },
        securityScheme(path): {'$ref': '#/components/securitySchemes/' + path},
        '#link': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 link using a JSON Pointer subpath.' } },
        link(path): {'$ref': '#/components/links/' + path},
        '#callback': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 callback using a JSON Pointer subpath.' } },
        callback(path): {'$ref': '#/components/callbacks/' + path},
        '#pathItem': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 3.2 path item using a JSON Pointer subpath.' } },
        pathItem(path): {'$ref': '#/components/pathItems/' + path},
          },
          }
    |||
  )
