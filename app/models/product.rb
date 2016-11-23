class Product < ApplicationRecord
  attr_accessor :remove_image

  belongs_to :category
  has_many :order_items

  mount_uploader :image, ProductUploader

  def self.keyword_search(search, category)
    where("category_id = #{category} AND (name LIKE ? OR description LIKE ?)", "%#{search}%", "%#{search}%") 
  end
end
