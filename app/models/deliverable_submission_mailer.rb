class DeliverableSubmissionMailer < ActionMailer::Base


  def notify_faculty(deliverable,faculty,submitter)
    subject "Deliverable submitted by #{submitter} for Course : #{deliverable.course.name} , Task : #{deliverable.task_number}"
    recipients faculty.email
    from deliverable.person.email
    sent_on Time.now

    body  :deliverable =>deliverable , :faculty_name =>faculty.human_name , :submitter =>submitter
  end

end
