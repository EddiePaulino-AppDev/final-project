class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:company, :title, :first_name, :last_name])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:company, :title, :first_name, :last_name])
  end

  before_action :set_paper_trail_whodunnit    
  
  def user_for_paper_trail
    user_signed_in? ? current_user.id : "Public user"
  end
    
  def not_found
  raise ActionController::RoutingError.new('Not Found')
  end


end
