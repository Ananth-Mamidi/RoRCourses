class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :tutors, each_serializer: TutorSerializer
end