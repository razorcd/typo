require 'spec_helper'

describe Admin::CategoriesController do
  render_views

  before(:each) do
    Factory(:blog)
    #TODO Delete after removing fixtures
    Profile.delete_all
    henri = Factory(:user, :login => 'henri', :profile => Factory(:profile_admin, :label => Profile::ADMIN))
    request.session = { :user => henri.id }
  end

  it "test_index" do
    get :index
    assert_response :redirect, :action => 'index'
  end
  
  it "index should redirect to new" do
    get :index
    expect(response).to redirect_to :action => :new
  end

  describe "test_new" do

      # before :each do
      # end
      # let (:existing_category) {FactoryGirl.create(:category)

      it "should render template 'new' with a new category" do
        get :new
        expect(assigns(:category)).to be_a_new(Category)
        expect(response).to render_template :new
      end

  end
  
  describe "test_create", :tag => true do
    let (:category_attr) {FactoryGirl.attributes_for(:category)}  
    
    it "should create a new category" do
      # Category.should_receive :new
      # Category.should_receive :save
      expect { post :edit, {:category => category_attr} }.to change{Category.count}.by 1
      expect(assigns(:category)).to eq Category.last
      expect(response).to redirect_to :action => :new
    end
  end
  



# let (:category1) {FactoryGirl.create(:category)
# let (:category_attr) {FactoryGirl.attributes(:category)
# @new_record = Category.new

# - any_instance_of(Admin::CategoriesController).should receive :new_or_edit

# get new
#   - should render :new
#   - assigns(:category).should eq @new_record
#   # should assign :category
#   # - Category.should_receive :new and_return @new_record
#   expect(assigns(:category)).to be_a_new(Category)


# get edit
#   get :edit, params => category1
#   - should render :new
#   - @category.should eq category1
#   - should assign @category
#   - Category.should_receive :find
  
  
# post create
#   post :edit , params => category_attr
#   - controller.params.should eq category_attr
#   - should render :new
#   - @category.should eq category_attr
#   - should assign @category
#   - Category.should_receive :new
#   - response.should redirect_to :action => :new
  

# post update
#   new_cat = category1
#   new_cat.name = "ABC"
#   post :edit , params => new_cat
#   - controller.params.should eq new_cat
#   - should render :new
#   - @category.should eq new_cat
#   - should assign @category
#   - Category.should_receive :find
#   - response.should redirect_to :action => :new
  









  describe "test_edit" do
    before(:each) do
      get :edit, :id => Factory(:category).id
    end

    it 'should render template new' do
      assert_template 'new'
      assert_tag :tag => "table",
        :attributes => { :id => "category_container" }
    end

    it 'should have valid category' do
      assigns(:category).should_not be_nil
      assert assigns(:category).valid?
      assigns(:categories).should_not be_nil
    end
  end

  it "test_update" do
    post :edit, :id => Factory(:category).id
    assert_response :redirect, :action => 'index'
  end

  describe "test_destroy with GET" do
    before(:each) do
      test_id = Factory(:category).id
      assert_not_nil Category.find(test_id)
      get :destroy, :id => test_id
    end

    it 'should render destroy template' do
      assert_response :success
      assert_template 'destroy'      
    end
  end

  it "test_destroy with POST" do
    test_id = Factory(:category).id
    assert_not_nil Category.find(test_id)
    get :destroy, :id => test_id

    post :destroy, :id => test_id
    assert_response :redirect, :action => 'index'

    assert_raise(ActiveRecord::RecordNotFound) { Category.find(test_id) }
  end
  
end

