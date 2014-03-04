FactoryGirl.define do
  factory :sales_import do
    document_file_name "somefile"
    document_content_type "application/octet-stream"
    document_file_size "15"
    gross_revenue 0
  end
end