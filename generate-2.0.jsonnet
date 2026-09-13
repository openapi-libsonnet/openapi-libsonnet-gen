local generate = import 'generate.jsonnet';
local refSource = |||
  + {
  ref: {
    '#': { name: 'ref', help: 'OpenAPI 2.0 reusable component references.' },
    '#ref': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference from a complete JSON Reference path.' } },
    ref(path): {'$ref': path},
    '#definition': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 2.0 definition using a JSON Pointer subpath.' } },
    definition(path): {'$ref': '#/definitions/' + path},
    '#parameter': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 2.0 parameter using a JSON Pointer subpath.' } },
    parameter(path): {'$ref': '#/parameters/' + path},
    '#response': { function: { args: [{ default: null, enums: null, name: 'path', type: ['string'] }], help: 'Creates a reference to an OpenAPI 2.0 response using a JSON Pointer subpath.' } },
    response(path): {'$ref': '#/responses/' + path},
  },
  }
|||;
function(schema)
  generate(schema, refSource)
