class Category < ActiveRecord::Base
  has_many :quotes
  accepts_nested_attributes_for :quotes
  validates :title, :presence => true, :length  => { :maximum => 140, :minimum => 3 }
  
end
