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

puts "Folder and User associations"
f1.users << u1
f2.users << u2
f3.users << u1
f4.users << u2