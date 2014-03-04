class SalesImportsController < ApplicationController
  before_action :set_sales_import, only: [:show]

  # GET /sales_imports/1
  # GET /sales_imports/1.json
  def show
  end

  # GET /sales_imports/new
  def new
    @sales_import = SalesImport.new
  end

  # POST /sales_imports
  # POST /sales_imports.json
  def create
    @sales_import = SalesImport.new(
      document_file_name: sales_import_params[:document].original_filename,
      document_file_size: sales_import_params[:document].size,
      document_content_type: sales_import_params[:document].content_type,
      doc_file_system_path: sales_import_params[:document].path
    )
    respond_to do |format|
      if @sales_import.save 
        format.html { redirect_to @sales_import, notice: 'Purchases were successfully imported.' }
        format.json { render action: 'show', status: :created, location: @sales_import }
      else
        format.html { render action: 'new' }
        format.json { render json: @sales_import.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_import
      @sales_import = SalesImport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_import_params
      params.require(:sales_import).permit(:document)
    end
end
