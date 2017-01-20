def make_seeds
  make_users
  make_events
  make_images
  make_comments
  make_tags
end

def make_users
  ["Amanda", "Katie","Arel","Logan","Tristan","Ari"].each {|name| User.create(name: name)}
end

def make_events
  ["Best Birthday", "Sexy Wedding", "Wu-Tang Concert"].each do |title|
    Event.create(title: title, user_id: User.first.id)
  end
end

def make_images
  ['Image 1','Image 2','Image 3','Image 4','Image 5'].each do |title|
    Image.create(title: title, event_id: Event.first.id)
  end
end

def make_comments
  ['Very Nice','This is great!','I believe it!','One more time!','Ok Ok'].each do |content|
    Comment.create(content: content, image_id: Image.first.id )
  end
end

def make_tags
  ['Tag 1','Tag 2','Tag 3','Tag 4','Tag 5'].each do |content|
    Tag.create(content: content)
  end
end

make_seeds
