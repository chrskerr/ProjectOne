User.destroy_all
u1 = User.create :name => 'Chris', :email => 'chris@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :admin => true
u2 = User.create :name => 'Simon', :email => 'simon@ga.com', :password => 'chicken', :password_confirmation => 'chicken'
puts "#{ User.count } users created"

Folder.destroy_all
f1 = Folder.create :name => 'All'
f2 = Folder.create :name => 'All'
f3 = Folder.create :name => 'Photos'
f4 = Folder.create :name => 'Songs'
f5 = Folder.create :name => 'Recipes'
f6 = Folder.create :name => 'Movies'
puts "#{ Folder.count } folders created"

puts "Folder and User associations"
f1.users << u1
f2.users << u2
f3.users << u1
f4.users << u2
f5.users << u1 << u2
f6.users << u2 << u1