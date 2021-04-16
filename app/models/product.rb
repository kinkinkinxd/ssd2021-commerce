class Product < ApplicationRecord
    enum status: [:draft, :published, :archived]
    validates :stock, numericality: {greater_than_or_equal_to: 0}
    validates :title, length: {minimum: 1 }
    validates :description, length: {minimum: 1}

    has_many :categories_products
    has_many :categories, through: :categories_products

    has_one_attached :cover_image
    has_many_attached :images

    attr_accessor :remove_cover_image, :remove_images
    after_save :purge_cover_image, if: :remove_cover_image
    private def purge_cover_image
        return unless @remove_cover_image == '1'
        cover_image.purge_later
    end

    after_save :purge_images, if: :remove_images
    private def purge_images
        return unless @remove_images == '1'
        images.purge_later
    end
end