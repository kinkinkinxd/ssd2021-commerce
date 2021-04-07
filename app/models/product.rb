class Product < ApplicationRecord
    enum status: [:draft, :published, :archived]
    validates :stock, numericality: {greater_than_or_equal_to: 0}
    validates :title, length: {minimum: 1 }
    validates :description, length: {minimum: 1}

    has_many :categories_products
    has_many :categories, through: :categories_products
end