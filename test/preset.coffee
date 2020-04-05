#! node_modules/.bin/jest --onlyChanged
import {extname} from 'path'
import {compile, FILE_EXTENSIONS} from 'coffeescript'
import {defaults as exampleConfig} from 'jest-config' #@jest/types
import {validate, multipleValidOptions} from 'jest-validate'
import {isMatch} from 'micromatch'
import preset from '..'
import {main} from '../package'#.json

describe main[2..], =>
  it "is a valid Jest config", =>
    [glob] = Object.keys preset.transform
    exampleConfig.transform = [glob]: 'transformer'
    recursiveBlacklist = ['process']
    {isValid} = validate preset, {exampleConfig, recursiveBlacklist}
    expect(isValid).toBe true

  it "exports a #{process} method", =>
    expect(preset).toMatchObject process: expect.any Function

  describe "CoffeeScript", =>
    it "transforms #{extname __filename} files", =>
      #expect("A spade").toBe "A spade"
      source = '=>'
      js = compile source, bare: true
      expect(preset.process source, __filename).toMatch RegExp js

    it "works with Promises/await", =>
      n = await new Promise (resolve) => resolve 1
      expect(n).toBe 1

  it "patches the describe global for CoffeeScript", =>
    expect(Object.keys describe).toEqual []

  FILE_EXTENSIONS.map (ext) =>
    ext = ext[1..]
    describe "moduleFileExtensions", =>
      it "includes #{ext}", =>
        expect(preset.moduleFileExtensions).toContain ext

    describe "testMatch", => #jest --listTests
      #regex = new RegExp preset.testRegex
      it "matches .#{ext} files", =>
        #expect("test/file.#{ext}").toMatch regex
        resolve = (glob) => glob.replace '<rootDir>', '.'
        glob = preset.testMatch.map resolve
        expect(isMatch "test/file.#{ext}", glob).toBe true

    describe "transform", =>
      [glob] = Object.keys preset.transform
      it "matches .#{ext} files", =>
        #expect(match ext, glob).toContain ext
        expect(isMatch ext, "(#{glob})").toBe true
