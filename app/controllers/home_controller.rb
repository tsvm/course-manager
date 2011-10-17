class HomeController < ApplicationController
  def index
    @courses = Course.current
    @enrollment = Enrollment.new
  end
end
