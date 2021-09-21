class CoursesController < ApplicationController

  before_action :load_courses, only: [:index]
  before_action :validate_course_params, only: [:create]
  
  def index
  	render json: @courses, each_serializer: CourseSerializer, meta: meta_data(@courses)
  end

  def create
    course = Courses.create(name: params[:course_name], description: params[:description])
    params[:tutor_names].each do |tutor_name| 
      Tutors.create(name: tutor_name, course_id: course.id)
  	end
  	return render json: course, status: 201, serializer: CourseSerializer if course.present?
  	render status: :unprocessable_entity, json: {
      errors: course.try(:errors)
    }
  end

  private

  def load_courses
  	@courses = ::Courses.all
  end

  def validate_course_params
    return invalid_request_error unless %i[course_name tutor_names description].all? { |e| params[e] }
  end

  def invalid_request_error
    render status: :unprocessable_entity, json: { errors: "Invalid or Missing input params" }
  end
end
