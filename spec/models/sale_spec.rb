require 'spec_helper'

describe Sale do
  it { should validate_presence_of(:purchaser_name) }
  it { should validate_presence_of(:quantity) }  	
  it { should validate_numericality_of(:quantity) }  	
  it { should belong_to(:item) }
  it { should belong_to(:merchant) }

end
