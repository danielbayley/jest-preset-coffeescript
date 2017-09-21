{FILE_EXTENSIONS} = require 'coffeescript'

task 'generate', "Generate Jest preset JSON config.", =>
  coffee = FILE_EXTENSIONS.map (ext) => ext[1..]
  glob = coffee.join '|'
  preset =
    moduleFileExtensions: [ 'js', 'json', coffee... ]
    transform: "#{glob}": process.env.npm_package_name
    testRegex: "tests?/.*\\.(#{glob})$"
    testPathIgnorePatterns: [ 'node_modules', 'fixtures' ]

  # coffeelint: disable=no_debugger
  console.log JSON.stringify preset, null, 2
