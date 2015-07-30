# Manticore: A Rails 4.x Boilerplate App

You can use this project as a starting point for a Rails web application. It's TDD ready, and has some great defaults for styles and layout.

[Check out the demo](http://manticore-rails.herokuapp.com/) you can login as an administrator with: `admin@example.com / administrator`

## Featuring
* Rails 4
* Mongoid as database
* Devise with OmniAuth for user management and authentication
* CanCan for user access control
* Haml for default views
* Simple Form for forms
* Unicorn UI for CSS styling with default scripts and form helpers

## Installation
- Clone this repo
- Edit `db/seed.rb` to customize admin user settings then run `rake db:seed` to create admin user
- Edit `config/initializers/devise.rb` to customize your omniauth providers (set env vars or disable, etc)
- Edit `config/config.yml` to customize your application settings, they will be available via `AppConfig` object within your app, e.g. `AppConfig.default_role`
- Run with `unicorn -p 2222` and browse at `http://localhost:2222`

## Simple Form
By default, your form fields will be wrapped using simple form, however there are a few custom wrappers you can use as well:

**Select Fields**

```ruby
= simple_form_for @challenge do |f|
  .field
    = f.label 'Challenge Type'
    = semantic_select :type, f, ['option 1', 'option 2'], default: 'None'
  .field
    = f.submit t('submit')
```

**Checkboxes or Radio Fields**
```ruby
= f.input :remember_me, as: :boolean, wrapper: :semantic_checkbox
```

---
### Links

* [Devise](http://github.com/plataformatec/devise)
* [OmniAuth](https://github.com/intridea/omniauth)
* [CanCan](https://github.com/ryanb/cancan)