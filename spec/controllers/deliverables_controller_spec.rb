require 'spec_helper'

describe DeliverablesController do

  def mock_deliverable(stubs={})
    @mock_deliverable ||= mock_model(DeliverableSubmission, stubs)
  end

  describe "GET index" do
    it "assigns all deliverables as @deliverables" do
      DeliverableSubmission.stub(:find).with(:all).and_return([mock_deliverable])
      get :index
      assigns[:deliverables].should == [mock_deliverable]
    end
  end

  describe "GET show" do
    it "assigns the requested deliverable as @deliverable" do
      DeliverableSubmission.stub(:find).with("37").and_return(mock_deliverable)
      get :show, :id => "37"
      assigns[:deliverable].should equal(mock_deliverable)
    end
  end

  describe "GET new" do
    it "assigns a new deliverable as @deliverable" do
      DeliverableSubmission.stub(:new).and_return(mock_deliverable)
      get :new
      assigns[:deliverable].should equal(mock_deliverable)
    end
  end

  describe "GET edit" do
    it "assigns the requested deliverable as @deliverable" do
      DeliverableSubmission.stub(:find).with("37").and_return(mock_deliverable)
      get :edit, :id => "37"
      assigns[:deliverable].should equal(mock_deliverable)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created deliverable as @deliverable" do
        DeliverableSubmission.stub(:new).with({'these' => 'params'}).and_return(mock_deliverable(:save => true))
        post :create, :deliverable => {:these => 'params'}
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "redirects to the created deliverable" do
        DeliverableSubmission.stub(:new).and_return(mock_deliverable(:save => true))
        post :create, :deliverable => {}
        response.should redirect_to(deliverable_url(mock_deliverable))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved deliverable as @deliverable" do
        DeliverableSubmission.stub(:new).with({'these' => 'params'}).and_return(mock_deliverable(:save => false))
        post :create, :deliverable => {:these => 'params'}
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "re-renders the 'new' template" do
        DeliverableSubmission.stub(:new).and_return(mock_deliverable(:save => false))
        post :create, :deliverable => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested deliverable" do
        DeliverableSubmission.should_receive(:find).with("37").and_return(mock_deliverable)
        mock_deliverable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :deliverable => {:these => 'params'}
      end

      it "assigns the requested deliverable as @deliverable" do
        DeliverableSubmission.stub(:find).and_return(mock_deliverable(:update_attributes => true))
        put :update, :id => "1"
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "redirects to the deliverable" do
        DeliverableSubmission.stub(:find).and_return(mock_deliverable(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(deliverable_url(mock_deliverable))
      end
    end

    describe "with invalid params" do
      it "updates the requested deliverable" do
        DeliverableSubmission.should_receive(:find).with("37").and_return(mock_deliverable)
        mock_deliverable.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :deliverable => {:these => 'params'}
      end

      it "assigns the deliverable as @deliverable" do
        DeliverableSubmission.stub(:find).and_return(mock_deliverable(:update_attributes => false))
        put :update, :id => "1"
        assigns[:deliverable].should equal(mock_deliverable)
      end

      it "re-renders the 'edit' template" do
        DeliverableSubmission.stub(:find).and_return(mock_deliverable(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested deliverable" do
      DeliverableSubmission.should_receive(:find).with("37").and_return(mock_deliverable)
      mock_deliverable.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the deliverables list" do
      DeliverableSubmission.stub(:find).and_return(mock_deliverable(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(deliverables_url)
    end
  end

end
