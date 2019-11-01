User.destroy_all
u1 = User.create :name => 'Chris', :email => 'chris@ga.com', :password => 'chicken', :password_confirmation => 'chicken', :admin => true
u1 = User.create :name => 'Simon', :email => 'simon@ga.com', :password => 'chicken', :password_confirmation => 'chicken'
puts "#{ User.count } users created"