class PagesController < ApplicationController
  include HighVoltage::StaticPage

  skip_after_action :verify_authorized, except: :index
  skip_after_action :verify_policy_scoped, only: :index

end
