class Folder < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :uploads
end
