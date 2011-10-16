class LecturersController < ApplicationController
  def index
    @lecturers = Lecturer.all
  end

  def show
    @lecturer = Lecturer.find(params[:id])
  end

end
