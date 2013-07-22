# americo

Quickly build a professional website for service oriented businesses.

## Setting up the production environment

###Setting up mailer

Change the action mailers defualt url options in your production environment `/config/environments/production.rb`:

```ruby
config.action_mailer.default_url_options = { :host => 'your-domain.com' }
```

The SMTP production environment settings are currently setup for Gmail. If you want to change this to your own SMTP server, modify `/config/environments/production.rb`:

```ruby
config.action_mailer.smtp_settings = {
  address: "smtp.gmail.com", # Change this
  port: 587,
  domain: "example.com",
  authentication: "plain",
  enable_starttls_auto: true,
  user_name: ENV["GMAIL_USERNAME"], # Change this
  password: ENV["GMAIL_PASSWORD"] # Change this
}
```


If you've deployed to Heroku, setup your Gmail SMTP username and password:

  heroku config:add GMAIL_USERNAME=myname@gmail.com
  heroku config:add GMAIL_PASSWORD=mypassword 
