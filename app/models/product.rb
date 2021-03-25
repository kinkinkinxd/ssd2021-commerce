class Product < ApplicationRecord
    validates :stock, numericality: {greater_than_or_equal_to: 0}
    validates :title, length: {minimum: 1 }
    validates :description, length: {minimum: 1}

    has_many :categoties_products
    has_many :categoties, through: :categoties_products
end