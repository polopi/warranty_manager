class Product < ActiveRecord::Base
  belongs_to :category
  has_one :warranty
  accepts_nested_attributes_for :warranty
end
