class ApplicationController < ActionController::Base
  include GlobalInfo
  include Seo
  include Performance
  
  protect_from_forgery with: :exception
  before_action do
    GlobalInfo.pass_parameters(params)
  end
end
