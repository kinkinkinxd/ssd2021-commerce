class Category < ApplicationRecord
    has_many :categories_products
    has_many :products, through: :categories_products
end
