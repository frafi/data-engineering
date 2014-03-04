require 'spec_helper'

describe Item do
	subject(:item) { create :item }
	it { should validate_presence_of(:description) }
	it { should validate_presence_of(:price) }  	
	it { should validate_numericality_of(:price) }  	

	it "should have a valid price" do
		subject.price = -1
		expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Price must be greater than 0')
	end
end
