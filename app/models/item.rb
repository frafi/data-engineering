class Item < ActiveRecord::Base
	has_many :sales
  	validates_presence_of :description, :price
  	validates_numericality_of :price, greater_than: 0
  	
# == Schema Information
#
# Table name: items
#
#  id              :integer      not null, primary key
#  description     :string
#  price           :decimal
#  created_at      :datetime
#  updated_at      :datetime
#
end
