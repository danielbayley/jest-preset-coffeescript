import fs from 'fs'
import path from 'path'
import {compile, helpers as h, FILE_EXTENSIONS} from 'coffeescript'

coffee = FILE_EXTENSIONS.map (ext) => ext[1..]

if describe?
  override = describe
  # coffeelint: disable=no_backticks
  `describe = (name, fn) => override (name, () => { fn() })`

module.exports =
  moduleFileExtensions: ['js', 'json', coffee...]
  testMatch: ["<rootDir>/*@(test|spec)?(s){/**/,}*.@(#{coffee.join '|'})"]
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
