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


####~



####~


####~

