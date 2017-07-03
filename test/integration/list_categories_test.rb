require 'test_helper'
#due to the class same name as create_categories_test it will run both, change books to sports it will have an error due to duplicate
#class CreateCategoriesTest < ActionDispatch::IntegrationTest
class ListCategoriesTest < ActionDispatch::IntegrationTest
  
  def setup
    @category = Category.create(name: "books")
    @category2 = Category.create(name: "programming")
  end
  
  test "should show categories listing" do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end