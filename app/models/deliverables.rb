class Deliverables < ActiveRecord::Base
  has_attached_file :zip

  validates_attachment_presence :zip,
    :message => "Pleaes attach a zip file"

  validates_attachment_content_type :zip,
    :content_type => ['application/zip'],
    :message => "Please attach a .zip file"
end
