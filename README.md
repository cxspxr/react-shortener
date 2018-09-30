# :zap: React URL Shortener with Rails API :cyclone:

This is ***monolithic*** project structure as opposed to [this](https://github.com/cxsper/vue-shortener) where I am agnostic about the backend.

What I'm gonna use:

* [React](https://github.com/facebook/react)

* [Webpack](https://github.com/webpack/webpack) for bundling & developing

* [CoffeeScript2](https://github.com/jashkenas/coffeescript)

* [Stylus](https://github.com/stylus/stylus) CSS Preprocessor with [Rupture](https://github.com/jescalan/rupture) media queries

* [PostCSS](https://github.com/postcss/postcss) for `lint`ing and `autoprefix`ing mostly

* [SugarSS](https://github.com/postcss/sugarss) to `lint` `Stylus`

* [Babel](https://github.com/babel/babel) along with it's ***delightful*** breaking changes in `v7`

* [Jest](https://github.com/facebook/jest), [Enzyme](https://github.com/airbnb/enzyme) for testing (I would not call it testing, I'm new to `Jest` & `Enzyme` and to the whole `React` ecosystem)

* [Husky](https://github.com/typicode/husky) to manage GIT hooks & to run `Jest` test on `pre-commit` & `pre-push`

* [Heroku](https://heroku.com) for delpoyment & for local development using `Rake` + `./Procfile.dev` in order to run my `Rails API` server along with `webpack-dev-server`. I belive it's okay to do like this.

----

## Development

Use `rake start` to boot `bundle exec rails -s` and `webpack-dev-server` simultaneously.

---

## Project Structure

### `client/public`
Static files.

### `client/src/api`
API module for `count`ing, `store`ing and `get`ing `Links`.

### `client/src/components`
This one serves as the React `components'` storage. Usually `client/src/components/`.sample contains `.coffee` for the logic written in `CoffeeScript2`, `.sss` for the styles written in `Stylus/SugarSS` and the `.test.coffee` for  testing with `Jest`.

***Sometimes*** it contains another folder `inline` which serves for inline styles for ***some*** components needed to be overwritten.


### `client/utils/*.js`
`Jest` configuration.

### `client/utils/encode`
`base62` number encoder and the `.test.coffee` for it.

### `client/utils/url`
`process.env.APP_URL` passed using the `Webpack` bundler.

### `client/utils/variables`
`Stylus/SugarSS` variables.

### `client/App.coffee`
Entry point. We call it `instance` in `VueJS`. Has it's own `App.sss` with styles.

### `client/index.(dev|prod).js`
That's how `Webpack` knows what he should do in different `environments`. I need the `hot-loading` during the development.

### `client/jest.config.js`
`Jest` configuration.

### `client/postcss.config.js`
`PostCSS` plugins.

### `webpack.(common|dev|prod).js`
`.common` to be shared between `.dev` & `.prod` for different `env`

---

:tada:
