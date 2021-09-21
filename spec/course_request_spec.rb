RSpec.describe "Company Requests", :type => :request do
  
  describe 'Create new course' do
  	before(:each) do
  	  Courses.destroy_all
  	  Tutors.destroy_all
  	end

  	after(:all) do
  	  Courses.destroy_all
  	  Tutors.destroy_all
  	end

    context 'creates a course with valid params' do
      it 'should create a new course with tutors and return the course' do
        payload = {
      	  course_name: "Data structures",
      	  description: "Data structures is a core computer science concept",
      	  tutor_names: ["A", "B", "C"]
        }
        post '/courses', payload
        expect_status(200)
        course = Courses.last
        expect(course.name).to eq "Data structures"
        expect(course.description).to eq "Data structures is a core computer science concept"
        expect(Tutors.count).to eq 3
        expect(Tutors.last.course_id).to eq course.id
       end
    end

    context 'creates a course with missing params' do
      it 'should not create a new course with tutors and return unprocessable_entity' do
        payload = {
      	  description: "Data structures is a core computer science concept",
      	  tutor_names: ["A", "B", "C"]
        }
        post '/courses', payload
        expect_status(422)
       end
    end
  end

  describe 'Create new course' do
  	before(:each) do
  	  course1 = Courses.create(name: 'test', description: 'test description')
  	  course2 = Courses.create(name: 'test2', description: 'test description2')
  	  Tutors.create(name: 'A', course_id: course1.id)
  	  Tutors.create(name: 'B', course_id: course1.id)
  	  Tutors.create(name: 'C', course_id: course2.id)
  	  Tutors.create(name: 'D', course_id: course2.id)
  	end

  	after(:all) do
  	  Courses.destroy_all
  	  Tutors.destroy_all
  	end

    context 'Lists all the courses and their tutors' do
      it 'should return the courses and tutors' do
        get '/courses'
        expect_status(200)
       end
    end
  end
end