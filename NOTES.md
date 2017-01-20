User:

* User visits the Homepage

* Homepage has:
  Navigation Bar:
    - Account > sign in/sign up
  Page Content
    - Background Image/Color
    - sign in/sign up

* User clicks on Account
    - sign in > enter email, password
    - sign up > enter name, email, password

* After signin/signup
    - displays users page
        - displays events

* User clicks on Event
    - displays images
    - displays options for event
    - displays option to view users
    - displays option to invite more users to view event

* User clicks on Image
    - displays image
    - displays image options
    - displays comments

App:

Models:
* Session

* User
name
emailpassword:
password

has_many :events (user.events) shows all events user has
has_many :images (user.images)
has_many :comments

* Friendship
self referential, user model, joint table  

* Event
title
date
description

belongs_to :user (event.user) shows user(admin) for event
??? has_many :users (event.users) shows all users who contributed to event
has_many :images (event.images) shows all images for event

* Image
title
date
description

has_many :comments (image.comments)
has_many :image_tags
has_many :tags, through: image_tags (image.tags)
belongs_to :user (image.user)

* Comment
content

belongs_to :user (comment.user)
belongs_to :image (comment.image)

* ImageTag (joint table btw image/tag)
image_id
tag_id

* Tag
content
has_many :image_tags
has_many :images, through: image_tags (tag.images)

Image upload:
Paperclip

Freinship:
acceptance column in table
set to false
change to true when accepted
