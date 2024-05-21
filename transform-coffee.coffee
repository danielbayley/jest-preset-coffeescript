{compile, helpers: h, FILE_EXTENSIONS} = require('coffeescript')
babel = require('@babel/core')
transform = babel.transform

module.exports =
  process: (source, file) =>
    return source unless h.isCoffee file

    if h.isLiterate file
      source = h.invertLiterate source

    coffeeCompiled = compile source,
      bare: true
      sourceMap: true
      filename: file
      header: false


    transpile =
      plugins: ['@babel/transform-modules-commonjs']
      presets: ['jest']
      sourceMaps: 'inline'
      inputSourceMap: JSON.parse coffeeCompiled.v3SourceMap
    
    # jest >= 27.x expects babel return format
    # { code, map, ast }
    transform coffeeCompiled.js, transpile