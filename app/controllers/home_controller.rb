class HomeController < ApplicationController
  def index
    @course = Course.last
    @enrollment = Enrollment.new
  end
end
