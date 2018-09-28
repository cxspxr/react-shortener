const merge = require('webpack-merge')
const common = require('./webpack.common.js')

const path = require('path')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const CleanWebpackPlugin = require('clean-webpack-plugin')
const {DefinePlugin} = require('webpack')
const UglifyJsPlugin = require('uglifyjs-webpack-plugin');

module.exports = merge(common, {
  entry: './src/index.prod.coffee',
  devtool: 'nosources-source-map',
  plugins: [
    new CleanWebpackPlugin(['dist']),
    new HtmlWebpackPlugin({
      template: path.resolve('./public/index.html'),
      inject: 'body',
      minify: {
        removeComments: true,
        collapseWhitespace: true,
        conservativeCollapse: true
      }
    }),
    new UglifyJsPlugin,
    new DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify('production'),
        APP_URL: JSON.stringify(process.env.APP_URL)
      }
    })
  ]
})
