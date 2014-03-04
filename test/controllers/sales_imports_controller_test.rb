require 'test_helper'

class SalesImportsControllerTest < ActionController::TestCase
  setup do
    @sales_import = sales_imports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sales_imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sales_import" do
    assert_difference('SalesImport.count') do
      post :create, sales_import: { document_content_type: @sales_import.document_content_type, document_file_name: @sales_import.document_file_name, document_file_size: @sales_import.document_file_size }
    end

    assert_redirected_to sales_import_path(assigns(:sales_import))
  end

  test "should show sales_import" do
    get :show, id: @sales_import
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sales_import
    assert_response :success
  end

  test "should update sales_import" do
    patch :update, id: @sales_import, sales_import: { document_content_type: @sales_import.document_content_type, document_file_name: @sales_import.document_file_name, document_file_size: @sales_import.document_file_size }
    assert_redirected_to sales_import_path(assigns(:sales_import))
  end

  test "should destroy sales_import" do
    assert_difference('SalesImport.count', -1) do
      delete :destroy, id: @sales_import
    end

    assert_redirected_to sales_imports_path
  end
end
