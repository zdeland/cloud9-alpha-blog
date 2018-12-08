require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
   def setup
    @user = User.create(username:"John", email: "john@email.com",password: "password",admin:true)
    @category = Category.create(name:"sports")
    @category2 = Category.create(name:"art")
   end
   
   
   test "Should show categories listing" do
       get categories_path
       assert_template "categories/index"
       assert_select "a[href=?]",category_path(@category),@category.name
       assert_select "a[href=?]",category_path(@category2),@category2.name
       
   end
   
   test "invalid category submission results in failure" do
       sign_in_as(@user)
       get new_category_path
       assert_template 'categories/new'
       assert_no_difference 'Category.count' do
        post categories_path, params: {category: {name: ""}}
       end 
       assert_template 'categories/new'
       assert_select "h2.card-title"
       assert_select "div.card-body"
   end
   
end