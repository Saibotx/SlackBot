# README

A slackbot that maintains and constantly syncs a database of users with that of a Slack workspace!

## Getting Started

### Prerequisites
You'll need ruby version >=2.2.2, rails version 5 and PostgreSQL 10.


#### Ruby
If you're not up to date, use a version manager to update. Here are two popular version managers.

```
# when using rbenv
$ rbenv install 2.3.1
# set 2.3.1 as the global version
$ rbenv global 2.3.1
```

```
# when using rvm
$ rvm install 2.3.1
# set 2.3.1 as the global version
$ rvm use 2.3.1
```

#### Rails
If rails is not up to date, you can do the following:

```
$ gem update rails
```

#### PostgreSQL 10
`https://installvirtual.com/install-postgresql-10-on-mac-os-x/`


### Clonining and installing dependencies.

This is pretty standard stuff. Simply
```
$ git clone git@github.com:Saibotx/SlackBot.git
$ bundle install
```

#### Setting enviornment variables
Head over to your [Slack App API Dashboard](https://api.slack.com/apps) and grab your credentials to put in `.env.development`

#### Now set up database and run!
```
$ rake db:migrate
$ rails s
```

#### App Tunneling
This local app needs to be accessible from the public Internet in order to install it on a Slack Workspace

For example with [ngrok](https://ngrok.com/), run this command to set up proxying to our port:

```
ngrok http 3000
```


### Tests
```
$ bundle exec rspec
```
