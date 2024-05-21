import fs from 'fs'
import path from 'path'
import { FILE_EXTENSIONS} from 'coffeescript'
import { transform } from '@babel/core'

coffee = FILE_EXTENSIONS.map (ext) => ext[1..]

if describe?
  override = describe
  # coffeelint: disable=no_backticks
  `describe = (name, fn) => override (name, () => { fn() })`

module.exports =
  moduleFileExtensions: ['js', 'json', coffee...]
  testMatch: ["<rootDir>/*@(test|spec)?(s){/**/,}*.@(#{coffee.join '|'})"]
  testPathIgnorePatterns: ['node_modules', 'fixtures']
  transform: [coffee.join '|']: path.join __dirname, 'transform-coffee'
  setupFilesAfterEnv: [__filename ]
