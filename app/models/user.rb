class User < ApplicationRecord
    has_secure_password
    validates :email, :presence => true, :uniqueness => true 
    has_and_belongs_to_many :folders
end
