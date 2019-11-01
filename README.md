# ProjectOne

## Week 6 project for SEI 34, General Assembly Sydney

### [Live Site]() - coming soon...

My idea so far:
- Dropbox Clone (primary idea)
    - Users table, with secure log-in etc
    - File register table
    - Permissions table (many-to-many between users & files)
    - Folders table? Allows files to be added to folders
    - Actions to upload a file, display it as a downloadable link. Delete the file. Share the file. etc.
    - Allows progress into folders, complex permission structures, etc, as time permits

Other notes:
- Trees folder contains heaps of basic art, in case I was building a basic tree-growing page. Probably unneeded now. 
- Third table can always be the join table, don't stress about it per the above. One for users, one for the content, one for join, and then any extra s needed.
- [Table Design](https://docs.google.com/presentation/d/1ODImeVmxoO8LnUwSr4AdAa0sZUfOBDUoQR8W5_o0DjY/edit?usp=sharing)

Controller structure
- Core will have front page for whole site, and front-page of each individual function of site. Can be seen without logging in. 
- Same with session and users
- All other controllers must be logged in.
- Admin page:
    - at top of controller "before_action :check_for_admin"
    - or in users controller:
        - "before_action :check_for_admin, :only => [:admin_page]"

Other ideas:
- Multi-user text editor
    - One table for users, one table for active documents and authorised editors, third table for something else? Might be needed to perform the many-to-many database linkages for first two. 
    - Simple interface to create accounts, open documents, type, save, etc
    - Simultaneous edits good follow-on, once locking & non-simultaneous is done 
- Gardening game
    - One table for users, another to collect their garden elements (what, where, age, last "tended", etc), and another to link them to friends, so read-only or read-write their gardens? 
    - Cleaner visuals, functionality, etc, good follow-ons
- Reminders app
    - Shared reminders. One table for user accounts, one for reminders, and one for sharing.
    - Could add shared notes, or calendars, or similar to take further?
- FTP server
    - User accounts, file tracking, sharing permissions

# [Brief](https://gist.github.com/wofockham/42880541c94121516109)

## PROJECT #1 DESCRIPTION

It's time to put everything that you've learned in the past 5 weeks together! For
project #1 you will use your knowledge of front and back-end web
development to produce an awesome web application that can be used by friends,
family or any of the other billions of people who use the Internet. The type of
web application you create is your choice.

The objective of this project is to:

* To pull everything together by building a web application from the ground up.
* To demonstrate mastery of topics covered during this course so far.

You will be working **individually** for this project. Show us what you've
got!

## CORE REQUIREMENTS
Make sure to do all of the following with your app.

* **Models.** Your app should have at least 3 models. Make sure they are
associated correctly!
* **Views.** Use partials to DRY (Don’t Repeat Yourself) up your views.
* **Handles invalid data.** Forms in your application should validate data and
handle incorrect inputs. Validate sign up information, verify valid email
addresses and secure passwords.
* **Use Gems** Use a GEM that talks to an API to add functionality to your app.
* **User Login.** Make sure you have basic authentication and authorization set up (if you need it).
* **Heroku.** Deploy your code to Heroku.

## CHALLENGE ADD-ONS
We may not have covered all of these in class, but if you want to push yourself
and learn something new, optionally consider doing some of the following with
your app.

* **Front-end Framework.** Use either Twitter Bootstrap or Foundation to kick start your front-end.
* **File upload.** Take a look at Cloudinary.
* **Web Scraping.** Check out Nokogiri.


## PLANNING & DELIVERABLES

#### Project Plan deliverables:

* **Scope.** What are you planning to build? What features will it have? What do
you reasonably think you can implement in the time period?
* **Object Models.** Draw out the model associations for your project.
* **Wireframes.** Sketch out what a few of your core pages will look like and
how they will work. Paper works great. You can also check out wireframing
software like Gliffy or Omnigraffle.
* **Milestones.** Outline some milestones for yourself based on how you prefer
to work.
* **Readme.md** Projects need a readme file in markdown explaining their project: a how and why of what you wanted to solve, how you built, problems, tech used.

#### Completed Project deliverables:

* Link to Heroku hosted project
* Link to source code on GitHub


## Things to keep in mind
Make sure that your code is:

* In it the proper places. Logic in views? Fat controllers?
* Is it DRY? Can I reuse parts of this project's code?
* Well-commented. Will we understand what is going on in your controllers?
* Well-formatted. Make it pretty.
* Adheres to a styleguide.

We’ll also be looking at:

* Quality of communication around decision-making. Can you defend why you chose
a certain technology or why you implemented your solution in a certain way?
* Your ability to pick up new technologies and push yourself.