# README

In order to test the implementation of the Oauth provider and client please follow the following step

`cd into your desired directory`

`git clone https://github.com/dennisdevulder/sso_nerds`

`git clone https://github.com/dennisdevulder/sso_client`

`cd sso_nerds`

`bundle install`

`rake db:migrate`

`bundle exec rspec spec to see the test suite`

`rails s`

In order to configure the provider go to http://localhost:3000/oauth_clients/new and make sure all fields are filled in with the following values:
Name: choose a name, doesn't matter
Main App URL: http://localhost:3000
Callback URL: http://localhost:4567/auth/test (the one our Sinatra app will handle, where the server must redirect after successful login)
Support URL: http://localhost:3000/support

in another tab, please cd into the sso_client directory

`bundle install`

`change the .env file to match your client_id and client_secret provided`

`ruby app.rb`

Visit http://localhost:4567/auth/test to start the Oauth sign-on protocol and check the success page, and the persisting page to make sure the session is held correctly.
