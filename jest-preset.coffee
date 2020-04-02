import fs from 'fs'
import path from 'path'
import {compile, helpers as h, FILE_EXTENSIONS} from 'coffeescript'
import package_json, {jest} from './package'#.json

{name} = path.parse __filename
coffee = FILE_EXTENSIONS.map (ext) => ext[1..]
glob = "*.@(#{coffee.join '|'})"

package_json.main = jest.preset = "./#{name}"
[staged] = Object.values package_json['lint-staged']
package_json['lint-staged'] = [glob]: staged
delete jest.rootDir
fs.writeFileSync 'package.json', JSON.stringify package_json, null, 2

if describe?
  override = describe
  # coffeelint: disable=no_backticks
  `describe = (name, fn) => override (name, () => { fn() })`

module.exports =
  moduleFileExtensions: ['js', 'json', coffee...]
  testMatch: ["<rootDir>/*@(test|spec)?(s){/**/,}#{glob}"]
  testPathIgnorePatterns: ['node_modules', 'fixtures']
  transform: [coffee.join '|']: __filename
  setupFilesAfterEnv: [__filename ]

  process: (source, file) =>
    return source unless h.isCoffee file

    if h.isLiterate file
      source = h.invertLiterate source

    transpile =
      plugins: ['@babel/transform-modules-commonjs']
      presets: ['jest']

    compile source, { bare: true, inlineMap: true, transpile }
