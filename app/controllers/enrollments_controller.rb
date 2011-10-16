# -*- coding: utf-8 -*-
class EnrollmentsController < ApplicationController

  def create
    current_course = Course.last

    if student_signed_in?
      enrollment = Enrollment.find_by_course_id_and_student_id(current_course.id, current_student.id)
      unless enrollment
        enrollment = Enrollment.new
        enrollment.course = current_course
        enrollment.student = current_student
        enrollment.verified = true
        if enrollment.save
          redirect_to root_path
        else
          redirect_to root_path, notice: 'Възникна грешка при записването'
        end
      end
    end
  end

end
