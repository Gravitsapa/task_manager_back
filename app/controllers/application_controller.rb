class ApplicationController < ActionController::API
  include Knock::Authenticable
  before_action :authenticate_user, except: [:create]
end
