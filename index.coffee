import {compile, helpers as h} from 'coffeescript'

exports.process = (source, file) =>
  return source unless h.isCoffee file

  if h.isLiterate file
    source = h.invertLiterate source

  transpile =
    plugins: ['@babel/transform-modules-commonjs']
    presets: ['jest']

  compile source, { bare: true, inlineMap: true, transpile }
