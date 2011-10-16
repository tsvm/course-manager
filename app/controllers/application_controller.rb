class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale

  # recover from RecordNotFound gracefully
  rescue_from ActionController::RoutingError, :with => :render_404
  rescue_from ActionController::UnknownAction, :with => :render_404
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404 with exception: #{exception.message}"
    end

    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end

  def set_locale
    I18n.locale = :en if is_a?(RailsAdmin::ApplicationController)
  end
end
