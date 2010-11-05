Factory.define :robert, :class => Person do |p|
  p.persistence_token Time.now.to_f.to_s
  p.first_name 'Robert'
  p.last_name "Engel"
  p.human_name "Robert Engel"
  p.email "roertb.engel@sv.cmu.edu"
  p.is_student 1
  p.teams { |t| [t.association :team_r]}
end

Factory.define :robert_staff, :class => Person do |p|
  p.persistence_token Date.yesterday.to_time.to_f.to_s
  p.first_name 'Rob'
  p.last_name "Eng"
  p.human_name "Rob Engel"
  p.email "rob.engel@sv.cmu.edu"
  p.is_staff 1
end

Factory.define :bob, :class => Person do |p|
  p.persistence_token Date.tomorrow.to_time.to_f.to_s
  p.first_name 'Ibrahim'
 p.last_name "ALShehri"
  p.human_name "Ibrahim"
  p.email "ibrahim.alshehri@sv.cmu.edu"
  p.is_student 1
  p.teams { |l| [l.association :team_i] }
end

Factory.define :staff, :class => Person do |p|
  p.persistence_token Date.yesterday.to_time.to_f.to_s
  p.first_name 'Martin'
  p.last_name "Radley"
  p.human_name "Martin Radley"
  p.email "m.radley@sv.cmu.edu"
  p.is_staff 1
end