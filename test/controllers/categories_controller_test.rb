require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  #(4)
  def setup
    @category = Category.create(name: "sports")
  end
  
  #(1)
  test "should get categories index" do
    get :index
    assert_response :success
  end
  #(2)
  test "should get new" do
   get :new
   assert_response :success
  end
  
  #(3) rake test then it still have 1 erros from show it needs ID - make the setup
  test "should get show" do
   get(:show, {'id' => @category.id}) #it will generate the route for show test without this
   assert_response :success
  end
end