class StudentsController < ApplicationController
  def profile
    @student = current_student
  end
end
