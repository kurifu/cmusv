Factory.define :deliverable, :class =>  Deliverables do |d|
  d.submission_date   Time.now
  d.zip_file_name     'name'
  d.zip_content_type  'application/zip'
  d.zip_file_size  300
end