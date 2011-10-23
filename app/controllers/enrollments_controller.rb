# -*- coding: utf-8 -*-
class EnrollmentsController < ApplicationController

  def create
    if student_signed_in?
      course = Course.find(params[:course_id])
      if course
        enrollment = Enrollment.find_by_course_id_and_student_id(course, current_student.id)
        unless enrollment
          enrollment = Enrollment.new
          enrollment.course = course
          enrollment.student = current_student
          enrollment.verified = false
          if enrollment.save
            redirect_to course_path(course)
          else
            redirect_to course_path(course), notice: 'Възникна грешка при записването'
          end
        end
      end
    end
  end

end
