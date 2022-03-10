class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['Basic_Auth_User'] , password: ENV['Basic_Auth_PW']
  
  def show
  end
end
