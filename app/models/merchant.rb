class Merchant < ActiveRecord::Base
	has_many :sales

  	validates_presence_of :name, :address

# == Schema Information
#
# Table name: merchants
#
#  id              :integer      not null, primary key
#  name  		   :string
#  address         :integer
#  created_at      :datetime
#  updated_at      :datetime
#

end
