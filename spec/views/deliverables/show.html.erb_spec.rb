require 'spec_helper'

describe "/deliverables/show.html.erb" do
  include DeliverablesHelper
  before(:each) do
    assigns[:deliverable] = @deliverable = stub_model(DeliverableSubmission)
  end

  it "renders attributes in <p>" do
    render
  end
end
