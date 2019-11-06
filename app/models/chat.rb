class Chat < ApplicationRecord
    validates :message, :presence => true
end
