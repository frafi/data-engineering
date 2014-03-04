class Item < ActiveRecord::Base
	has_many :sales

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
