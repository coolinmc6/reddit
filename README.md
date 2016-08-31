# Reddit Clone README

This is a Reddit clone where I walk through this video tutorial: [How to build a Reddit or Hacker News Style Web App in Rails 4](https://www.youtube.com/watch?v=7-1HCWbu7iU)

```ruby

```

####~4:00
Use scaffold to create link controller and model (and a ton of other files)

####~7:30
Begin creation of users by creating branch 'add_users'
####~9:00
Add Devise gem:
```ruby
gem 'devise', '~> 4.2' # added to Gemfile
```
```shell
rails generate devise:install
```
####~12:30
Actually create the user model using:
```shell
rails g devise User
```

####~20:00
```ruby
has_many :links # in the user.rb file
belongs_to :user # in the link.rb file
``` 
This creates the relationship between them.  When I go into the console, I can see that the relationshp is set-up by doing 
Link.first.user.  

####~21:45 => rails generate migration add_user_id_to_links user_id:integer
This add the user_id column to the links table.  After creating the migration, run "rails db:migrate".

####~24:30
I am updating the new and create actions in the links_controller.rb file so that the connection to the user is made...the code
below is what I used to replace them.  
```ruby
@link = current_user.links.build # new action
@link = current_user.links.build(link_params) # create action

```
I can double check that it worked by creating a link and then going into rails console:
```shell
rails c
link = Link.last
link.user
link.user.email
```
####~26:40 - Authentication
This prevents visitors to the site that are NOT users from deleting links.  If you DO try to destroy a link, when you
click destroy, it redirects you to the login page.
Q - How does this work?  What is this line showing me?

```ruby
before_filter :authenticate_user!, :except =>[:index, :show] # links_controller.rb
```

####~27:50
In the *index.html.erb* file, wrap the 'edit' and 'destroy' links in an if/then statement to prevent users editing or 
destroying the links of others.  I made two test links before building Users so any non-user will be able to edit or 
destroy those first two links.

####~31:10
Remove "add link" link

####~32:50 - Add Bootstrap
As a quick re-hash of how to add a gem, you need to:
1. Go to [rubygems.org](https://rubygems.org/) and search for the gem you want. 
2. Take a look at the documentation which will tell you how to install and use it.  These are the steps per
Bootstrap's [documentation](https://github.com/twbs/bootstrap-sass).
3. Add statement to the Gemile:
```ruby
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7' # Gemfile
```
3. run bundle install
```shell
bundle install
```
4.Import Bootstrap styles in app/assets/stylesheets/application.scss
```ruby
# "bootstrap-sprockets" must be imported before "bootstrap" and "bootstrap/variables"
@import "bootstrap-sprockets";
@import "bootstrap";
```
5. And so on...

####~35/36 - Styling
application.html.erb
show.html.erb
index.html.erb

####~40:00 - Styled _form.html.erb
Q - How do I edit the "url" and "title"?  Can I make them all caps?

####~40:30 - Style: Panel
Cool looking panel form to remember in bootstrap


