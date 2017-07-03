require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  #(4)
  def setup
    @category = Category.create(name: "sports")
    #(5)
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end
  
  #(1)
  test "should get categories index" do
    get :index
    assert_response :success
  end
  #(2)
  test "should get new" do
   session[:user_id] = @user.id #(5)
   get :new
   assert_response :success
  end
  
  #(3) rake test then it still have 1 erros from show it needs ID - make the setup
  test "should get show" do
   get(:show, {'id' => @category.id}) #it will generate the route for show test without this
   assert_response :success
  end
  
  #(5) will have 1 failure go to categories_controller.rb (require_admin)
  test "should redirect create when admin not logged in" do
   assert_no_difference 'Category.count' do
     post :create, category: { name: "sports" }
   end
   assert_redirected_to categories_path
  end
end