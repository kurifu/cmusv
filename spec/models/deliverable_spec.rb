require 'spec_helper'

describe DeliverableSubmission do
  before(:each) do
    @rob = Factory.create(:rob)
    @deliverable_submission = DeliverableSubmission.new(
      :submission_date  => Time.now,
      :submitter        => @rob.id
    )
  end

  it "is valid with valid attributes" do
    # valid attributes are: submission date, submitter (person id), and file attachment" #Updated on 10/20/2010
    #Note: Not certain if is easy to test the file attachment as a required field (10/20/2010)
    @deliverable_submission.should be_valid
  end

  it "is not valid without an submission date" do
    # See RspecExample Code
  end

  it "is not valid without an submitter" do#Updated on 10/20/2010
  end

  it "is not valid without a file attachment" do#Updated on 10/20/2010
  end

  it "should take an optional course_id and task_number passed in from the curriculum website"do
  end


  it "should create a new instance given valid attributes" do
    DeliverableSubmission.create!(@valid_attributes)
  end
end
