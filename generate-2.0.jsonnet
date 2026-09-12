local generate = import 'generate.jsonnet';
function(schema)
  generate(
    schema, |||
      + {
      ref: {
        ref(path): {'$ref': path},
        definition(path): {'$ref': '#/definitions/' + path},
        parameter(path): {'$ref': '#/parameters/' + path},
        response(path): {'$ref': '#/responses/' + path},
      },
      }
    |||
  )
