#! node_modules/.bin/jest -o
{basename, extname} = require 'path'
index = require '..'

describe "#{basename __filename}", =>
  it "exports a process method", =>
    expect(index).toMatchObject process: expect.any Function

describe "CoffeeScript", =>
  it "transforms #{extname __filename} files", =>
    expect("A spade").toBe "A spade"
