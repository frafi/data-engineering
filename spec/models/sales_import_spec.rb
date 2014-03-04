require 'spec_helper'

describe SalesImport do
  	subject(:sales_import) { create :sales_import }
  	it { should validate_presence_of(:document_content_type) }
  	it { should validate_presence_of(:document_file_size) }  	
  	it { should validate_presence_of(:document_file_name) }  	
  	it { should validate_presence_of(:gross_revenue) }  	
  	it { should validate_numericality_of(:gross_revenue) }  	

  	it "should have a valid gross revenue" do
  		subject.gross_revenue = -1
 		expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid,'Validation failed: Gross revenue must be greater than or equal to 0')
  	end
end
