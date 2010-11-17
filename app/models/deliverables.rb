class Deliverables < ActiveRecord::Base
  belongs_to :person
  belongs_to :course
  belongs_to :team
  after_save :prepare_and_send_faculty_email

  validates_attachment_presence :attachment

#   :url => "/:attachment/:id_:style.:extension",
#    :path => ":rails_root/public/:attachment/:id_:style.:extension",
   has_attached_file :attachment,
    :path => "attachments/:id/:filename",
    :storage => :s3,
      :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml"

#     :storage => :s3,
#    :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml",
#    :path => "attachments/:id"

#    :bucket => 'cmusv-rails-mfse-development'


  #validates_presence_of :submission_date, :person

  # Not needed; this message appears via deliverables views, but our upload
  # functionality is located in the courses controller
  #validates_attachment_presence :attachment

  # Not sure what file formats to accept
  #validates_attachment_content_type :attachment,
  #  :content_type => ['application/zip'],
  #  :message => "Please attach a .zip file"

  def prepare_and_send_faculty_email
     submitter =  (team && team.name) || person.human_name
     faculty = {}
      teams = Team.find(:all, :conditions => ["course_id = ? ", course.id])
      teams.each do |team|
        faculty[team.primary_faculty_id] = 1 unless team.primary_faculty_id.nil?
        faculty[team.secondary_faculty_id] = 1 unless team.secondary_faculty_id.nil?
      end
      faculty.each {|faculty_id | DeliverableSubmissionMailer.deliver_notify_faculty(self,User.find_by_id(faculty_id),submitter) }

  end
end
