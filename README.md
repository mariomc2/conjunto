# CONJUNTO

### Bootstrap

Set up Bootstrap with WebPacker

    yarn add bootstrap jquery popper.js

Add the following to config/webpack/environment.js

```
const webpack = require('webpack')

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
```

Add the following to app/javascript/packs/applications.js

    import 'bootstrap'

Create a folder to hold stylesheets, and create one **scss**

    $ mkdir app/javascript/stylesheets/
    $ touch app/javascript/stylesheets/application.scss

Add the following to: app/javascript/stylesheets/application.scss

    @import "~bootstrap/scss/bootstrap";
    @import '@fortawesome/fontawesome-free';

---
### simple_form

Add it to the gemfile:

    gem 'simple_form'

Run the generator with Bootstrap:

    rails generate simple_form:install --bootstrap

---
### devise

Add it to the gemfile:

    gem 'devise'

Run the generator:

    rails generate devise:install

Add the following to config/routes.rb

    root to: 'pages#home'

Edit the layout for alert notifications

    <p class="notice"><%= notice %></p>
    <p class="alert"><%= alert %></p>

Create the Model:

    rails generate devise User

Edit the Migration to add an Admin field:

    t.boolean :admin, :default => false

Run the migration:

    rails db:migrate

---
### Generate HomePage

    rails g controller pages home

---
### Seeding the DB

Construct the seeds by editing db/seeds.rb

Run the seeds:

    rails db:seed

---
### Create Apartments:

    rails generate scaffold Apartment identifier:string user:belongs_to

Add to the User Model:

    has_many :apartments, dependent: :destroy

---
### Create Residents:
    
    rails generate scaffold Resident name:string  \
        email:string telephone:string \
        apartment:belongs_to

Add to the Apartment Model:

    has_many :residents, dependent: :destroy

Config nested routes:

    resources :apartments do
        resources :residents
    end

Update paths
