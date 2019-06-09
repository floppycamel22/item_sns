class ApplicationController < ActionController::Base

	before_action :set_search
	before_action :configure_permitted_parameters, if: :devise_controller?

	def set_search
		@q = Post.ransack(params[:q])
		@posts = @q.result
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
	end

	def after_sign_in_path_for(resource)
		root_path
		# 6/6現在の時点で
	end

	def after_sign_out_path_for(resource)
		root_path
	end

end