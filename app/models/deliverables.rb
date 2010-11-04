class Deliverables < ActiveRecord::Base
  belongs_to :person
  belongs_to :course
  belongs_to :team

  has_attached_file :zip, :url => "/:attachment/:id_:style.:extension", :path => ":rails_root/public/:attachment/:id_:style.:extension"

  #validates_presence_of :submission_date, :person

  validates_attachment_presence :zip

  validates_attachment_content_type :zip,
    :content_type => ['application/zip'],
    :notice => "Please attach a .zip file"
end
