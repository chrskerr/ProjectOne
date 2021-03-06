# ProjectOne

## Week 6 project for SEI 34, General Assembly Sydney
### [Live Site - hosted on Heroku](https://chrskerr-projectone.herokuapp.com)


## Content:
- [Summary](#Summary)
- [Installation](#Installation)
- [Brief - external](https://gist.github.com/wofockham/42880541c94121516109)

## Summary
I have created a drop-box lite style file upload, storage, sharing and download site; which also includes live chat between users.

### Primary functions:
- File upload to server storage
- File sorting into folders, and display of files & folder structure 
- Sharing of folders and all contained files between users
- Messaging between users
- Live update of sent and received messages while both in the page
- Notification of folder change or message received when on a different page, so cannot witness change

### Major challenges:
- File and folder table structure to allow for sharing and storage simply 
- Action Cable (Web Sockets) to allow for messaging to logged-in users if a particular event occurs. This allows me to show a new-message notification for example.

### Current bugs:
- Messages multi-send sometimes on Heroku
- Select field in Dropdown list on Uploads page (for file New and file Edit) doesn't work in Chrome

- [Table Design](https://docs.google.com/presentation/d/1ODImeVmxoO8LnUwSr4AdAa0sZUfOBDUoQR8W5_o0DjY/edit?usp=sharing)


## Installation

### Requires:
- Rails 6+
- Postgresql
- Heroku with Postgreql and Redistogo add-ons 
- Ruby gems
    - Bootstrap
    - Popper
    - JQuery
    - CarrierWave
    - Redis
    - ActionCable

### Steps:
- Pull the repo
- Run:
    - `bundle install`
    - `rails db:create`
    - `rails db:migrate`
    - `rails db:seed`
- Then initialise server with `rails server`
