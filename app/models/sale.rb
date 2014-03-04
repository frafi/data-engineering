class Sale < ActiveRecord::Base
	belongs_to :item
 	belongs_to :merchant

  	validates_presence_of :purchaser_name, :quantity, :item, :merchant
	validates :quantity, numericality: { only_integer: true, greater_than: 0 }

# == Schema Information
#
# Table name: sales
#
#  id              :integer      not null, primary key
#  purchaser_name  :string
#  quantity        :integer
#  item_id         :integer
#  merchant_id     :integer
#  created_at      :datetime
#  updated_at      :datetime
#

end
