class ApplicationController < ActionController::API
	include DeviseTokenAuth::Concerns::SetUserByToken

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: User::ATTRIBUTES_WHITELIST)
	end
end
