require 'test_helper'

class TestfilesControllerTest < ActionController::TestCase
  setup do
    @testfile = testfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testfile" do
    assert_difference('Testfile.count') do
      post :create, testfile: { confidence_rank: @testfile.confidence_rank, content_type: @testfile.content_type, file_contents: @testfile.file_contents, filename: @testfile.filename }
    end

    assert_redirected_to testfile_path(assigns(:testfile))
  end

  test "should show testfile" do
    get :show, id: @testfile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testfile
    assert_response :success
  end

  test "should update testfile" do
    patch :update, id: @testfile, testfile: { confidence_rank: @testfile.confidence_rank, content_type: @testfile.content_type, file_contents: @testfile.file_contents, filename: @testfile.filename }
    assert_redirected_to testfile_path(assigns(:testfile))
  end

  test "should destroy testfile" do
    assert_difference('Testfile.count', -1) do
      delete :destroy, id: @testfile
    end

    assert_redirected_to testfiles_path
  end
end
