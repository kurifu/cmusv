module PeopleHelper

def display_location(person)
  return nil if (person.work_city.nil? && person.work_state.nil? && person.work_country.nil?)
  return "#{person.work_state} #{person.work_country}" if person.work_city.nil?
  return "#{person.work_city}, #{person.work_state} #{person.work_country}"

end

def add_person_classes(person)
   class_name = ""
   class_name += "student " if person.is_student
   class_name += "staff " if person.is_staff
   class_name += person.local_near_remote+" " if person.local_near_remote != "Unknown"
   class_name += "image " if  person.image_uri.index("mascot.jpg") !=nil
   class_name += "grad_this_year " if person.graduation_year == Time.now.year
   class_name += "email " if person.email.nil?
   class_name += "tigris" if person.tigris.nil?
   class_name += "active" if person.is_active
  return class_name
end

end

