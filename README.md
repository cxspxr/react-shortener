# :postbox: Rails API for URL Shortening :outbox_tray:

What I'm gonna use:

* [Rails](https://github.com/rails/rails) API 5.2.1

* [MySQL2](https://github.com/brianmario/mysql2)

* [RSpec](https://github.com/rspec/rspec-rails) for testing

* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) for simplier `RSpec` testing

* [Faker](https://github.com/stympy/faker)

* [Heroku](https://heroku.com/) for deployment & development

* [Husky](https://github.com/typicode/husky) to manage GIT hooks & to run `RSpec` test on `pre-commit` & `pre-push`

* [Rack::Attack](https://github.com/kickstarter/rack-attack) to prevent DOS
* [Rack CORS](https://github.com/cyu/rack-cors) for Cross-Origin Resource Sharing

* [Memcached/Dalli](https://github.com/petergoldstein/dalli) for requests throttling

* [Geocoder](https://github.com/alexreisner/geocoder) to track locations

----

## Development

Use `rails s` and [curl](https://github.com/curl/curl) for HTTP requests.

---

## Deployment

This might be deployed as an isolated API as it is shown [here](https://rails-shortener.herokuapp.com/api/links/count) (this **exactly** route returns the current number of links for `base62` encoding). Along with a frontend like [this](https://vue-shortener.herokuapp.com/) ([git](https://github.com/cxsper/vue-shortener) for it) served with some http server. Just don't forget to respect the `CORS` as it is shown [here](https://github.com/cxsper/react-shortener/blob/api/config/application.rb#L40).

On the other hand it could be deployed as a part of  monolithic system as it is shown [here](https://shorrtener.herokuapp.com/) ([react branch](https://github.com/cxsper/react-shortener/tree/react) of this repo) with a `Puma` for http serving.

---

## Project Structure

### `app/`

You may know the `app/` structure since it's pretty default. It's the home to `models`, `controllers`, `validators`, `exception handlers` etc.

#### Controllers

There are three controllers which are interesting for us:
* `application_controller` with module dependencies;
* `links_controller` handles `store`-ing, `get`-ing, `count`-ing for the `Link` model;
* `redirect_controller` with a single method to `redirect` and store the `Redirect` itself (i.e. it's location) using the [Geocoder](https://github.com/alexreisner/geocoder);

#### Models

* `Link` to store `:url` and `:shortened`;
* `Redirect` to store `:location` and `:time`;

A single `Link` has many `Redirects`. A single `Redirect` belongs to one `Link`.

#### Validators

* `Base62Validator` to `validate :base62` shortening;
* `UrlValidator` to `validate :url` formatting;

### `config/`

* `initializers/rack_attack.rb` to configure [Rack::Attack](https://github.com/kickstarter/rack-attack);

* `environments/*.rb` to manage heroku `production` and local environments (`development` and `testing`);

### `spec/`

This is for [RSpec](https://github.com/rspec/rspec-rails) with [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) & [Faker](https://github.com/stympy/faker) testing.

I belive that everything is backed by tests by now.

### Specific files

`.branch-ignore` is used by me to manage branch-specific `.gitignore` using [Husky](https://github.com/typicode/husky) and `.gitignore.<branch-name>` files.

### `/.*|(other)/` folders & files are pretty default
