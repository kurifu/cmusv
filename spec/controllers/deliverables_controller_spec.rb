require 'spec_helper'

describe DeliverablesController do

  before(:all){
    Person.delete_all
    Deliverables.delete_all
    Team.delete_all
    Course.delete_all
    course = Factory.create(:course)
    team = Factory.create(:team, :course => course)
    @good = Factory.create(:bob)
    @bad = Factory.create(:robert)
    @staff = Factory.create(:staff)
    team.people << @good
    @deliverable = Factory.create(:deliverable, :person => @good, :team => team)
  }

  def mock_deliverable(stubs={})
    @mock_deliverable ||= mock_model(Deliverables, stubs)
  end

  describe "GET index" do
    it "assigns all deliverables as @deliverables" do
      Deliverables.stub(:find).with(:all).and_return([mock_deliverable])
      get :index
      assigns[:deliverables].should == [mock_deliverable]
    end
  end

  describe "GET show" do
    
    it "lets a team member see a deliverable submitted by his team" do
      get :show, :id => @deliverable.id, :person_id => @good.id
      response.should render_template 'show'
    end

    it "should not allow a non team member to see a teams deliverable" do
      get :show, :id => @deliverable.id, :person_id => @bad.id
      response.should redirect_to deliverables_url
    end

    it 'should allow a staff to see any deliverable' do
      get :show, :id => @deliverable.id, :person_id => @staff.id
      response.should render_template 'show'
    end

  end

  describe "GET new" do
    it "assigns a new deliverable as @deliverable" do
      Deliverables.stub(:new).and_return(mock_deliverable)
      get :new
      assigns[:deliverable].should equal(mock_deliverable)
    end
  end


  describe "GET edit" do
    it "lets a team member edit a deliverable submitted by his team" do
      get :edit, :id => @deliverable.id, :person_id => @good.id
      response.should render_template 'edit'
    end

    it "should not allow a non team member to edit a teams deliverable" do
      get :edit, :id => @deliverable.id, :person_id => @bad.id
      response.should redirect_to deliverables_url
    end

    it "should allow a staff to edit any deliverables" do
      get :edit, :id => @deliverable.id, :person_id => @staff.id
      response.should render_template 'edit'
    end
  end


  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created deliverable as @deliverable" do
        Deliverables.stub(:new).with({'these' => 'params'}).and_return(mock_deliverable(:save => true))
        post :create, :deliverable => {:these => 'params'}
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "redirects to the created deliverable" do
        Deliverables.stub(:new).and_return(mock_deliverable(:save => true))
        post :create, :deliverable => {}
        response.should redirect_to(deliverable_url(mock_deliverable))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved deliverable as @deliverable" do
        Deliverables.stub(:new).with({'these' => 'params'}).and_return(mock_deliverable(:save => false))
        post :create, :deliverable => {:these => 'params'}
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "re-renders the 'new' template" do
        Deliverables.stub(:new).and_return(mock_deliverable(:save => false))
        post :create, :deliverable => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    it "lets a team member update a deliverable submitted by his team" do
      put :update, :id => @deliverable.id, :person_id => @good.id
      response.should redirect_to(deliverable_url(@deliverable))
    end

    it "should not allow a non team member to update a teams deliverable" do
      put :update, :id => @deliverable.id, :person_id => @bad.id
      response.should redirect_to deliverables_url
    end

    it "should allow a staff to update any deliverables" do
      put :update, :id => @deliverable.id, :person_id => @staff.id
      response.should redirect_to(deliverable_url(@deliverable))
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested deliverable" do
      Deliverables.should_receive(:find).with("37").and_return(mock_deliverable)
      mock_deliverable.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the deliverables list" do
      Deliverables.stub(:find).and_return(mock_deliverable(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(deliverables_url)
    end
  end

end
