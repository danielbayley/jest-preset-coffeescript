#! node_modules/.bin/jest -o
import {basename, extname} from 'path'
import index from '..'

describe "#{basename __filename}", =>
  it "exports a process method", =>
    expect(index).toMatchObject process: expect.any Function

describe "CoffeeScript", =>
  it "transforms #{extname __filename} files", =>
    expect("A spade").toBe "A spade"

  it "works with Promises/await", =>
    n = await new Promise (resolve) => resolve 1
    expect(n).toBe 1
