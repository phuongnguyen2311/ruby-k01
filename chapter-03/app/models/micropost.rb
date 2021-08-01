class Micropost < ApplicationRecord
    belongs_to :users, :optional => true
    
end
