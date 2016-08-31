# Reddit Clone README

This is a Reddit clone where I walk through this video tutorial: [How to build a Reddit or Hacker News Style Web App in Rails 4](https://www.youtube.com/watch?v=7-1HCWbu7iU)

```ruby

```



~20:00 =>
```ruby
has_many :links # in the user.rb file
belongs_to :user # in the link.rb file
``` 
This creates the relationship between them.  When I go into the console, I can see that the relationshp is set-up by doing 
Link.first.user.  

~21:45 => rails generate migration add_user_id_to_links user_id:integer
This add the user_id column to the links table.  After creating the migration, run "rails db:migrate".

###~24:30
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