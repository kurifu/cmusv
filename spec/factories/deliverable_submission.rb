Factory.define :deliverable, :class =>  Deliverables do |d|
  d.submission_date   Time.now
  d.attachment_file_name     'Test Attachment File Name'
  d.attachment_content_type  'application/octet-stream'
  d.attachment_file_size  300
end

Factory.define :deliverable_email, :class =>  Deliverables do |d|
  d.submission_date   Time.now
  d.attachment_file_name     'Test Attachment File Name'
  d.attachment_content_type  'application/octet-stream'
  d.attachment_file_size  300
  d.task_number 100
end
