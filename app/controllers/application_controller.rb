class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, :except => :index, unless: :devise_or_admin_controller?
  after_action :verify_policy_scoped, :only => :index, unless: :devise_or_admin_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à faire cette action."
    redirect_to(root_path)
  end

  def devise_or_admin_controller?
    devise_controller? || params[:controller].starts_with?("admin/")
  end

  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end
end
