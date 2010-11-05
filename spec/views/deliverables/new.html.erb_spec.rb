require 'spec_helper'

describe "/deliverables/new.html.erb" do
  include DeliverablesHelper

  before(:each) do
    assigns[:deliverable] = stub_model(DeliverableSubmission,
      :new_record? => true
    )
  end

  it "renders new deliverable form" do
    render

    response.should have_tag("form[action=?][method=post]", deliverables_path) do
    end
  end
end
