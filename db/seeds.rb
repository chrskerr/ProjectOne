User.destroy_all
u1 = User.create :name => 'Chris', :email => 'chris@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :admin => true
u2 = User.create :name => 'Simon', :email => 'simon@ga.com', :password => 'chicken', :password_confirmation => 'chicken'
u3 = User.create :name => 'Kate', :email => 'kate@ga.com', :password => 'chicken', :password_confirmation => 'chicken'
u4 = User.create :name => 'Amanda', :email => 'amanda@ga.com', :password => 'chicken', :password_confirmation => 'chicken'
u5 = User.create :name => 'Dan', :email => 'dan@ga.com', :password => 'chicken', :password_confirmation => 'chicken'
puts "#{ User.count } users created"

Folder.destroy_all
f1 = Folder.create :name => 'Home'
f2 = Folder.create :name => 'Home'
f3 = Folder.create :name => 'Running'
f4 = Folder.create :name => 'Snorkelling'
puts "#{ Folder.count } folders created"

Upload.destroy_all

Chat.destroy_all
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'Hello Kate'
sleep 2
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => 'Hello Chris'
sleep 2
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'How are you?'
sleep 2
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => "I'm great! How about you?"
sleep 2
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'Great to hear! I am also good'
sleep 2
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => 'Whats for lunch today?'
sleep 2
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => "I'm eating salad"
sleep 2
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'Salad too :)'
sleep 2
Chat.create :from_user => u1.id, :to_user => u3.id, :seen => false, :message => 'Gotta get back to class!'
sleep 2
Chat.create :from_user => u3.id, :to_user => u1.id, :seen => false, :message => 'Bye!'
sleep 2
puts "#{ Chat.count } messages created"



puts "Folder and User associations"
f1.users << u1
f2.users << u2
f3.users << u1
f4.users << u2