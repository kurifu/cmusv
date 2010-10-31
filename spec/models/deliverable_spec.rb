require 'spec_helper'

describe Deliverables do
  #
  # Talk to rahul and cliff about deliverable model name
  # plus the attributes should not be called 'zip'
  #

  before(:each) do
    @rob = Factory.build(:robert)
    @deliverable_submission = Factory.build(:deliverable, :person => @rob)
  end

  it "is valid with valid attributes" do
    # valid attributes are: submission date, person_id (person id), and file attachment" #Updated on 10/20/2010
    #Note: Not certain if is easy to test the file attachment as a required field (10/20/2010)
    @deliverable_submission.should be_valid
  end

  it "is not valid without a submission date" do
    # See RspecExample Code
    @deliverable_submission.submission_date = nil
    @deliverable_submission.should_not be_valid
  end

  it "is not valid without a person_id" do#Updated on 10/20/2010
   @deliverable_submission.person = nil
    @deliverable_submission.should_not be_valid
  end

  it "is not valid without a file attachment" do#Updated on 10/20/2010
     @deliverable_submission.zip_file_name = nil
     @deliverable_submission.zip_content_type = nil
     @deliverable_submission.zip_file_size = nil
    @deliverable_submission.should_not be_valid
  end

  it "should take an optional course_id, task_number, comments, and team_id passed in from the curriculum website"do
    @deliverable_submission.course_id = nil
    @deliverable_submission.should be_valid
    @deliverable_submission.course_id = Course.first
    @deliverable_submission.should be_valid

    @deliverable_submission.task_number = nil
    @deliverable_submission.should be_valid
    @deliverable_submission.task_number = 6
    @deliverable_submission.should be_valid

    @deliverable_submission.comments = nil
    @deliverable_submission.should be_valid
    @deliverable_submission.comments = "Comments"
    @deliverable_submission.should be_valid

    @deliverable_submission.team_id = nil
    @deliverable_submission.should be_valid
    @deliverable_submission.team_id = 21112
    @deliverable_submission.should be_valid
  end

end
