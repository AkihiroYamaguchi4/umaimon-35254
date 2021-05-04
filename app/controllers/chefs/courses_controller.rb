class Chefs::CoursesController < ApplicationController
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

 private

 def course_params
  params.require(:course).permit(:course_title, :description, :price, :start_date, :end_date, :images[]).merge(chef_id: current_chef.id)

 end
end
