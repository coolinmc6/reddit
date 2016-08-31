# Reddit Clone README

This is a Reddit clone where I walk through this video tutorial: [How to build a Reddit or Hacker News Style Web App in Rails 4](https://www.youtube.com/watch?v=7-1HCWbu7iU)




~20:00 => add 
'''ruby
has_many :links
''' 
to user.rb (User model) and 'belongs_to :user' in link.rb (Link model).  This creates 
the relationship between them.  When I go into the console, I can see that the relationshp is set-up by doing 
Link.first.user.  

~21:45 => rails generate migration add_user_id_to_links user_id:integer
This add the user_id column to the links table.  After creating the migration, run "rails db:migrate".

