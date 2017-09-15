{compile, helpers} = require 'coffeescript'

exports.process = (source, file) =>
  return source unless helpers.isCoffee file
  literate = helpers.isLiterate file
  compile source, { bare: true, literate, inlineMap: true }
