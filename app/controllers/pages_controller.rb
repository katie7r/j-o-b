class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_before_action :authenticate_user!
  skip_after_action  :verify_authorized
  skip_after_action  :verify_policy_scoped

end
