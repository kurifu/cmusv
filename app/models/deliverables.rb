class Deliverables < ActiveRecord::Base
  belongs_to :person
  belongs_to :course
  belongs_to :team

  has_attached_file :zip

  validates_presence_of :submission_date, :person

  validates_attachment_presence :zip,
    :message => "Pleaes attach a zip file"

  validates_attachment_content_type :zip,
    :content_type => ['application/zip'],
    :message => "Please attach a .zip file"
end
