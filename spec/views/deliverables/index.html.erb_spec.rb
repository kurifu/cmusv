require 'spec_helper'

describe "/deliverables/index.html.erb" do
  include DeliverablesHelper

  before(:each) do
    assigns[:deliverables] = [
      stub_model(DeliverableSubmission),
      stub_model(DeliverableSubmission)
    ]
  end

  it "renders a list of deliverables" do
    render
  end
end
