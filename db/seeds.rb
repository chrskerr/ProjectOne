User.destroy_all
u1 = User.create :name => 'Chris', :email => 'chris@example.com', :password => 'example', :password_confirmation => 'example', :admin => true
u2 = User.create :name => 'Example', :email => 'example@example.com', :password => 'example', :password_confirmation => 'example'
u3 = User.create :name => 'Kate', :email => 'Kate@example.com', :password => 'example', :password_confirmation => 'example'
puts "#{ User.count } users created"

Folder.destroy_all
f1 = Folder.create :name => 'default'
f2 = Folder.create :name => 'default'
f3 = Folder.create :name => 'default'
f4 = Folder.create :name => 'Shared'
puts "#{ Folder.count } folders created"

Upload.destroy_all

Chat.destroy_all
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'Hello Kate'
sleep 1
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => 'Hello Chris'
sleep 1
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'How are you?'
sleep 1
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => "I'm great! How about you?"
sleep 1
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'Great to hear! I am also good'
sleep 1
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => 'Whats for lunch today?'
sleep 1
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => "I'm eating salad"
sleep 1
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'Salad too :)'
sleep 1
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'Gotta get back to class!'
sleep 1
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => 'Bye!'
sleep 1
Chat.create :from_user => u1.id, :to_user => u2.id, :seen => false, :message => 'Hey Dad'
sleep 1
Chat.create :from_user => u2.id, :to_user => u1.id, :seen => false, :message => 'Hello Son'
sleep 1
Chat.create :from_user => u1.id, :to_user => u2.id, :seen => false, :message => "What's been happening?"
sleep 1
Chat.create :from_user => u2.id, :to_user => u1.id, :seen => false, :message => "Not heaps, you?"
sleep 1
Chat.create :from_user => u1.id, :to_user => u2.id, :seen => false, :message => 'About the same..'
sleep 1
Chat.create :from_user => u2.id, :to_user => u1.id, :seen => false, :message => 'Lunch today?'
sleep 1
Chat.create :from_user => u2.id, :to_user => u1.id, :seen => false, :message => "Love to, where?"
sleep 1
Chat.create :from_user => u1.id, :to_user => u2.id, :seen => false, :message => 'Greenwood'
sleep 1
Chat.create :from_user => u1.id, :to_user => u2.id, :seen => false, :message => 'See you at 12!'
sleep 1
Chat.create :from_user => u2.id, :to_user => u1.id, :seen => false, :message => 'Ciao'
sleep 1
puts "#{ Chat.count } messages created"



puts "Folder and User associations"
f1.users << u1
f2.users << u2
f3.users << u3
f4.users << u1 << u2 << u3