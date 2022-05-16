class Product < ApplicationRecord
    validates_presence_of :name, :size, :price
    has_many :ratings
    has_one_attached :image
end
