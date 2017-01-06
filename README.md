
# Energy Hub Platform

## Contents

* [Overview](#overview)
* [Dependencies](#dependencies)
* [Compatibility](#compatibility)
* [Development Setup](#development-setup)
* [Production Setup](#production-setup)
* [Deployment](#deployment)
* Additional Documentation
  * [Javascript Libraries](#javascript-libraries)
  * [Config Vars](https://github.com/eutectics/energyhub-platform/blob/master/doc/config_vars.md)
* [Admin User Permissions](#admin-user-permissions)

## Overview

The Energy Hub Platform is a project management tool for tracking energy projects.

The app is hosted on Heroku.

* `energyhub-platform-staging` is the staging instance of the app.
* `energyhub-platform.herokuapp.com` is the production instance of the app.

### Branches

* `master` is used for local development.
* `stable` reflects a stable, tested version of the app. This branch is deployed to Heroku for staging and production.

## Dependencies

* [See the Gemfile](https://github.com/eutectics/energyhub-platform/blob/master/Gemfile)
* Ruby 2.2.2
* Rails 4.2.1
* PostgreSQL

## Compatibility

### Supported Browsers

* Firefox 4+
* Google Chrome
* Safari 6+
* IE 9+

## Development Setup

### Configure and install the dependencies

* Install gems with `bundle install`

### Grab the Source

1. Clone the repo:

        $ git clone git@github.com:eutectics/energyhub-platform.git
        $ cd energyhub-platform
        $ git checkout -t origin/stable
        $ git checkout master

2. Install the Heroku Toolbelt: https://toolbelt.heroku.com/

3. Add Heroku remote:

        $ git remote add staging git@heroku.com:energyhub-platform-staging.git

4. Set the default remote for Heroku to `staging`:

        $ git config heroku.remote staging

### App Setup

1. Install dependencies:

        $ bundle install

2. Initialize the db and seed it:

        $ rake db:create
        $ rake db:migrate
        $ rake db:seed

3. Run unit tests:

        $ bundle exec rake spec

4. Start the server:

        $ bundle exec rails server

### Configure Heroku

Repeat these instructions for `energyhub-platform-staging` and `energyhub-platform`.

1. Follow the steps listed in [Development Setup](#development-setup).
2. Create the Heroku app:

        $ heroku create energyhub-platform-staging

3. Add Heroku add-ons.

        $ heroku addons:create newrelic:wayne --app energyhub-platform-staging

4. Add deploy hooks to send deploy notifications.

        $ heroku addons:create deployhooks:email --recipient "rosie@automotion.com sam@automotion.com kagan@automotion.com mike@automotion.com" --subject "{{user}} deployed {{app}}" --body "{{user}} deployed {{app}}\n\nCommit {{head}}\n\n{{git_log}}" --app energyhub-platform-staging
  

## Deployment

### Staging

**Note: the following commands assume you've set `energyhub-platform-staging` as your default Heroku app via the following command: `git config heroku.remote staging`.**

    $ heroku maintenance:on
    $ heroku pg:backups capture
    $ git push staging stable:master
    $ heroku run rake db:migrate
    $ heroku ps:restart
    $ heroku maintenance:off

### Production

1. Test changes locally.
  * Confirm test suite runs clean.
  * Confirm all functionality works as expected in develolpment using the deployment QA checklist.
  * Update the release notes.

2. Merge changes into the `stable` branch:
        
        $ git checkout stable
        $ git merge master
        $ git commit -m "Booyah"
        $ git push

3. Deploy to staging and test changes.

  * Follow steps above for deployment.
  * Confirm all functionality works as expected using the deployment QA checklist  .   

4. Deploy to `energyhub-platform`:

        $ heroku maintenance:on --app energyhub-platform
        $ heroku ps:scale web=0 worker=0 --app energyhub-platform
        $ heroku pg:backups capture --app energyhub-platform
        $ git push production stable:master
        $ heroku run rake db:migrate --app energyhub-platform
        $ heroku ps:scale web=2 worker=1 --app energyhub-platform
        $ heroku maintenance:off --app energyhub-platform

5. Test changes on production.

  * Confirm all functionality works as expected using the deployment QA checklist.  

6. Send release notes to the client.

## Additional Documentation

### Javascript Libaries

* Select2

Full [documentation for library](https://select2.github.io/).

In this application, the library is triggered by attaching the `data-behavior=selectable' attribute.

```
<select data-behavior="selectable menu-item-create">
  <option value="AL">Alabama</option>
  <option value="MN">Minnesota</option>
  <option value="WY">Wyoming</option>
</select>
```


## Admin User Permissions

There are currently 1 level of permissions: Admin

### Admin
Admin users are internal users and have full access to all authentication protected pages.


