class Chefs::CoursesController < ApplicationController
before_action :set_course, only: [:show]

  def index
    @chefs_courses = Course.all
  end
  

 def new
  @course = Course.new
 end

 def create
  @course = Course.new(course_params)
  if @course.save
    redirect_to root_path
  else
    render :new
  end
 end
 def show
 end
 
 private
 def set_course
  @course = course.find(params[:id])
end
 def course_params
  params.require(:course).permit(:course_title, :description, :price, :start_datetime, :end_datetime, course_images: []).merge(chef_id: current_chef.id)

 end
end
