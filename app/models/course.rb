class Course < ApplicationRecord
  has_many :tutors , :class_name => "Tutor", :dependent => :destroy
end
