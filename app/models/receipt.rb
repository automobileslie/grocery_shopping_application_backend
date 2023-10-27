class Receipt < ApplicationRecord
    has_many :purchases
    has_many :items, through: :purchases  
end
