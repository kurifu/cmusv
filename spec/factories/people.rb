Factory.define :robert, :class => Person do |p|
  p.persistence_token Time.now.to_f.to_s
  p.first_name 'Robert'
  p.last_name "Engel"
  p.human_name "Robert Engel"
  p.email "robert.engel@sv.cmu.edu"
  p.is_student 1
end

Factory.define :bob, :class => Person do |p|
  p.persistence_token Date.tomorrow.to_time.to_f.to_s
  p.first_name 'Bob'
  p.last_name "Engelen"
  p.human_name "Bob Engelen"
  p.email "bob.engelen@sv.cmu.edu"
  p.is_student 1
end

Factory.define :staff, :class => Person do |p|
  p.persistence_token Date.yesterday.to_time.to_f.to_s
  p.first_name 'Martin'
  p.last_name "Radley"
  p.human_name "Martin Radley"
  p.email "m.radley@sv.cmu.edu"
  p.is_staff 1
end