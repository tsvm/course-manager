class TopicsController < ApplicationController

  def show
    @topic = Topic.find(params[:id])
    @solution = Solution.new
  end

end
