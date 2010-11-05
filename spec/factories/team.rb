Factory.define :team, :class => Team do |t|
end

Factory.define :course, :class => Course do |c|
end

Factory.define :email_course, :class =>Course do |c|
 c.name "New Foundation" 
end

Factory.define :team_i, :class => Team do |t|
  t.name 'team I'
  t.course_id { |l| l.association  :email_course}
end

Factory.define :team_r, :class => Team do |t|
  t.name 'team R'
  t.primary_faculty_id { |l| l.association  :robert_staff}
  t.course_id { |l| l.association  :email_course}
end

