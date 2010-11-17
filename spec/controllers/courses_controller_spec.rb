require 'spec_helper'

describe CoursesController do

  before(:all) do
    Person.delete_all
    Deliverables.delete_all
    Team.delete_all
    Course.delete_all
    @course = Factory.create(:course)
    @team = Factory.create(:team, :course => @course)
    @good = Factory.create(:bob)
    @bad = Factory.create(:robert)
    @staff = Factory.create(:staff)
    @team.people << @good
    @deliverable = Factory.create(:deliverable, :person => @good, :team => team)
  end

  def mock_deliverable(stubs={})
    @mock_deliverable ||= mock_model(Deliverables, stubs)
  end

  describe "GET submit_deliverable" do
    it "should show the submit deliverable page" do
      # login here
      Deliverables.stub(:new).and_return(mock_deliverable)
      get :submit_deliverable
      assigns[:deliverable].should equal(mock_deliverable)
      #response.should render_template("submit_deliverable")
    end
  end
  
  describe "POST create_deliverable" do
    it "should create a deliverable" do
      Deliverables.stub(:new).and_return(mock_deliverable(:save => true))
      puts "should be successful!"
      post :create_deliverable
      assigns[:deliverable].should equal(mock_deliverable)
      #response.should render_template("show_deliverable")
    end
  end

  describe "GET show_deliverable" do
    it "should show the deliverable" do
      @course = Factory.create(:course)
      @team = Factory.create(:team, :course => @course)
      Deliverables.stub(:find).and_return(mock_deliverable)
      get :show_deliverable
      response.should render_template("show_deliverable")
      #response.should redirect_to("show_deliverable")
    end

    it "should display items from AmazonS3" do
      
      get :show_deliverable
      
    end
  end

end
