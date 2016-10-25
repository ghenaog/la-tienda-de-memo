# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  reference   :string
#  price       :decimal(, )
#  quantity    :integer
#  brand       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Product < ApplicationRecord
  #Associations
  belong_to :category

  #Validations
  validates :name, :reference, :price, :quantity, :brand, presence: true
  validates :price, numericality: true
  validates :quantity, numericality: {only_integer: true}
  validates :price, :quantity, numericality: {greather_or_equal_to: 0}
end
