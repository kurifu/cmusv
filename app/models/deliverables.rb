class Deliverables < ActiveRecord::Base
  belongs_to :person
  belongs_to :course
  belongs_to :team
  after_save :prepare_and_send_faculty_email

  has_attached_file :zip

  validates_presence_of :submission_date, :person

  validates_attachment_presence :zip,
    :message => "Pleaes attach a zip file"

  validates_attachment_content_type :zip,
    :content_type => ['application/zip'],
    :message => "Please attach a .zip file"

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
