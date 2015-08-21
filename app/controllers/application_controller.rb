class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  # after_action  :verify_authorized, except: :index
  after_action  :verify_policy_scoped, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def record_not_found
    standard_rescue_with 'Record could not be found.'
  end

  def user_not_authorized
    standard_rescue_with 'You are not authorized to perform this action.'
  end

  def standard_rescue_with(message, flash_type = 'alert')
    flash[flash_type.to_sym] = message
    redirect_to(request.referrer || root_path)
  end

  # TODO: figure out how I'm actually supposed to do this
end
