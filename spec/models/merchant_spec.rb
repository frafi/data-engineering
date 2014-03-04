require 'spec_helper'

describe Merchant do
  	subject(:merchant) { create :merchant }
  	it { should validate_presence_of(:name) }
  	it { should validate_presence_of(:address) }  	

  	it "should have an address and name" do
  		fake_address = "456 Fake St"
  		fake_name = "Jim Jones"
  		subject.name = fake_name
  		subject.name.should == fake_name
  		subject.address = fake_address
  		subject.address.should == fake_address
  	end

end
