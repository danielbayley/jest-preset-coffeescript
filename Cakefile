{FILE_EXTENSIONS} = require 'coffeescript'
fs = require 'fs'
package_json = require './package'

coffee = FILE_EXTENSIONS.map (ext) => ext[1..]
glob = coffee.join '|'

task 'generate', "Generate Jest preset JSON config.", =>
  preset =
    moduleFileExtensions: ['js', 'json', coffee...]
    testRegex: ".*(test|spec).*\\.(#{glob})$"
    testPathIgnorePatterns: ['node_modules', 'fixtures']
    transform: [glob]: package_json.name
    mapCoverage: true

  package_json.jest.transform = [glob]: './index'
  fs.writeFileSync 'package.json', JSON.stringify package_json, null, 2

  # coffeelint: disable=no_debugger
  console.log JSON.stringify preset, null, 2
