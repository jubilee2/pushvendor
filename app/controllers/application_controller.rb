class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_configurations

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.js { render plain: exception.message, status: :unauthorized }
      format.html { redirect_to root_url, alert: exception.message }
    end
  end

  private

  ##
  # set_configurations loads the global store configurations.
  def set_configurations
    @configurations = StoreConfiguration.last
  end
end
