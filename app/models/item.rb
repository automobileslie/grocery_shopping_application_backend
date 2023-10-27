class Item < ApplicationRecord
    has_many :purchases
    has_many :receipts, through: :purchases
    
end
