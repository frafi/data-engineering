class SalesImport < ActiveRecord::Base
  after_save :parse_document!

  validates_presence_of :document_file_name, :document_content_type, :document_file_size, :gross_revenue
  validates :gross_revenue, numericality: { greater_than: 0 }

  attr_accessor :doc_file_system_path

  def parse_document!
    @successes = 0
    gross_revenue = 0.0
    @parse_errors = []
    total_revenue = import_data!
    update_column(:gross_revenue, total_revenue) unless @successes.zero? and @parse_errors.empty?
    Rails.logger.debug "Total is #{total_revenue}"
  end

  private 

  def open_data_file
    parse_errors << "Unable to open the file #{doc_file_system_path}" unless doc_file_system_path
    results_file = Roo::CSV.new(doc_file_system_path, csv_options: {col_sep: "\t"}) if doc_file_system_path
  end

  def import_data!
    total_revenue = 0.0
    results_file = open_data_file
    return total_revenue unless results_file
    (1..results_file.last_row).map do |i|
      row = results_file.row(i)
      if row.blank?
      	@parse_errors << "Line #{i} is blank"
      	next
      end

      purchaser_name = row[0].to_s.strip
      unless purchaser_name
      	@parse_errors << "No purchaser name provided in #{i.ordinalize} line"
      	next
      end

      item_description = row[1].to_s.strip
      unless item_description
      	@parse_errors << "No item description provided in #{i.ordinalize} line"
      	next
      end

      item_price = BigDecimal.new(row[2].to_s.strip) rescue nil
      unless item_price
      	@parse_errors << "No item price provided in #{i.ordinalize} line"
      	next
      end

      quantity = row[3].to_i rescue 0
      if quantity.zero?
      	@parse_errors << "No quantity provided in #{i.ordinalize} line"
      	next
      end
      
      total_revenue += quantity * item_price

      merchant_address = row[4].to_s.strip
      unless merchant_address
        @parse_errors << "No merchant address provided in #{i.ordinalize} line"
        next
      end

      merchant_name = row[5].to_s.strip
      unless merchant_name
      	@parse_errors << "No merchant name provided in #{i.ordinalize} line"
      	next
      end
      begin
	      item_purchased = Item.find_or_create_by(description: item_description, price: item_price)
	      merchant = Merchant.find_or_create_by(name: merchant_name, address: merchant_address)
		    Sale.create! purchaser_name: purchaser_name, quantity: quantity, item: item_purchased, merchant: merchant
	  	  @successes += 1
	    rescue
      	@parse_errors << "Failed to import sales data from #{i.ordinalize} line"
	  	  next
	    end
    end
    total_revenue
  end
end