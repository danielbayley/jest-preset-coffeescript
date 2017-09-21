#! node_modules/.bin/jest -o
import match from 'nanomatch'
import {FILE_EXTENSIONS} from 'coffeescript'
import preset from '../jest-preset'#.json

describe 'Cakefile', =>
  describe 'generate', =>
    it "generates a valid Jest preset JSON config", =>
      valid =
        moduleFileExtensions: expect.any Array
        testRegex: expect.any String
        transform: expect.any Object
        testPathIgnorePatterns: expect.any Array

      expect(preset).toMatchObject valid

    FILE_EXTENSIONS.map (ext) =>
      ext = ext[1..]
      describe 'moduleFileExtensions', =>
        it "includes #{ext}", =>
          expect(preset.moduleFileExtensions).toContain ext

      describe 'testRegex', =>
        regex = new RegExp preset.testRegex
        it "matches .#{ext} files", =>
          expect("test/file.#{ext}").toMatch regex

      describe 'transform', =>
        [glob] = Object.keys preset.transform
        it "matches .#{ext} files", =>
          expect(match ext, glob).toContain ext
