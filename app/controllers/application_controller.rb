class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  # I don't understand how he wrote the above protected method.  This is what it originally was:
  	# def configure_permitted_parameters
   	#  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  	# end
	# Again, this appears to be a change to Rails 5 and the syntax for this gem.  The newer version does
	# make more sense.
end
