require 'spec_helper'

describe "/deliverables/edit.html.erb" do
  include DeliverablesHelper

  before(:each) do
    assigns[:deliverable] = @deliverable = stub_model(DeliverableSubmission,
      :new_record? => false
    )
  end

  it "renders the edit deliverable form" do
    render

    response.should have_tag("form[action=#{deliverable_path(@deliverable)}][method=post]") do
    end
  end
end
