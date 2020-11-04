# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [ ] Use ActiveRecord for storing information in a database
- [ ] Include more than one model class (e.g. User, Post, Category)
- [ ] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
- [ ] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
- [ ] Include user accounts with unique login attribute (username or email)
- [ ] Ensure that the belongs_to resource has routes for all CRUD actions
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message

TODOs
- [ ] Create edit and destroy actions
- [ ] Only allow logged in users to see index and show page
- [ ] Only allow user who created listing to edit/delete
- [ ] Associate user who created listing to the listing
- [ ] Show only listings created by signed in user
- [ ] Make sure user inputs required fields on property creation (and edit form)

Futures
- [ ] Replace @error messages/erb renderings in post routes with redirects and flash messages
- [ ] Change image to upload function (binary) instaed of url string
- [ ] Add investors/financiers model (has many users and properties)
