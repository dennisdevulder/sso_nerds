# README

In order to test the implementation of the Oauth provider and client please follow the following step

`cd into your desired directory`

`git clone https://github.com/dennisdevulder/sso_nerds`

`git clone https://github.com/dennisdevulder/sso_client`

`cd sso_nerds`

`bundle install`

`rake db:migrate && rake db:test:prepare`

`bundle exec rspec spec`

`rails s`

In order to configure the provider go to http://localhost:3000/oauth_clients/new and register for a new account.

After signing up you will be prompted to fill in a new provider, do so with the following values:

Name: choose a name, doesn't matter

Main App URL: http://localhost:3000

Callback URL: http://localhost:4567/auth/test (the one our Sinatra app will handle, where the server must redirect after successful login)

Support URL: http://localhost:3000/support

in another tab, please cd into the sso_client directory

`bundle install`

`change the app.rb file to match your client_id and client_secret provided`

`ruby app.rb`

Visit http://localhost:4567/auth/test to start the Oauth sign-on protocol and check the success page, and the persisting page to make sure the session is held correctly.
