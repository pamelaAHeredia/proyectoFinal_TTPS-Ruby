class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include Error
end
