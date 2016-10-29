# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  name               :string
#  reference          :string
#  price              :decimal(, )
#  quantity           :integer
#  brand              :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category_id        :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Product < ApplicationRecord

  #Associations
  belongs_to :category
  has_many :purchases, dependent: :destroy

  #paperclip
  has_attached_file :image, styles: { thumb: "242x200#", micro_thumb: "50x50#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  #Validations
  validates :name, :reference, :price, :quantity, :brand, :category, presence: true
  validates :price, numericality: true
  validates :quantity, numericality: {only_integer: true}
  validates :price, :quantity, numericality: {greather_or_equal_to: 0}

  def available?
    self.quantity > 0 ? true : false
  end

  def update_stock
    self.quantity -= 1
    self.save
  end

end
