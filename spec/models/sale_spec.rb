require 'spec_helper'

describe Sale do
  subject(:sale) { create :sale }
  it { should validate_presence_of(:purchaser_name) }
  it { should validate_presence_of(:quantity) }  	
  it { should validate_numericality_of(:quantity) }  	
  it { should belong_to(:item) }
  it { should belong_to(:merchant) }

  it "should have a valid quantity" do
  	subject.quantity = -1
 	expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Quantity must be greater than 0')
  end
end
