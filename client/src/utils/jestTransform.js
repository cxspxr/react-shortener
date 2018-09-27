const { helpers, compile } = require('coffeescript')

exports.process = (source, file) => {
  if (!helpers.isCoffee(file)) {
    return source
  }
  if (helpers.isLiterate(file)) {
    source = helpers.invertLiterate(source)
  }
  return compile(source, {
    transpile: {
      plugins: ['transform-es2015-modules-commonjs'],
      presets: ['@babel/env', '@babel/react']
    },
    bare: true,
    inlineMap: true
  })
}
