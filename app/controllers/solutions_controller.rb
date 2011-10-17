class SolutionsController < ApplicationController

  def create
    solution = Solution.new params[:solution]
    solution.student = current_student

    solution.save

    redirect_to topic_path(solution.assignment.topic)
  end

end
