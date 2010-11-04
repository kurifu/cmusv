class Deliverables < ActiveRecord::Base
  belongs_to :person
  belongs_to :course
  belongs_to :team

#   :url => "/:attachment/:id_:style.:extension",
#    :path => ":rails_root/public/:attachment/:id_:style.:extension",
   has_attached_file :zip,
     :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml",
    :path => ":attachment/:id/#{:zip_file_name}.:extension",
    :bucket => 'cmusv-rails-mfse-development'

  #validates_presence_of :submission_date, :person

  validates_attachment_presence :zip

  validates_attachment_content_type :zip,
    :content_type => ['application/zip'],
    :notice => "Please attach a .zip file"
end
