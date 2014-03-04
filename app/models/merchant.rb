class Merchant < ActiveRecord::Base
	has_many :sales

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
