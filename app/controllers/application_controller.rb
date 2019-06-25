class ApplicationController < ActionController::Base

	before_action :set_search
	before_action :configure_permitted_parameters, if: :devise_controller?

	def set_search
		@q = Post.ransack(params[:q])
		@posts = @q.result.includes(:user).page(params[:page]).per(9)
		@u = User.ransack(params[:q])
		@users = @u.result
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
	end

	def after_sign_in_path_for(resource)
		user_following_post_path(current_user)
	end

	def after_sign_out_path_for(resource)
		root_path
	end
end