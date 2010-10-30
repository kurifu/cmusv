Factory.define :rob, :class => :person do |p|
  p.persistence_token Time.now.to_f.to_s
  p.first_name "Rob"
  p.last_name "Engel"
  p.human_name "Rob Engel"
  p.email "rob.engel@sv.cmu.edu"
  p.is_student 1
  p.password 'test'
  p.password_confirmation 'test'
end
