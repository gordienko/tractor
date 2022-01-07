class AdminController < ApplicationController
  layout 'admin'
  include Pagy::Backend

  def authenticate_admin
    redirect_to '/admin', alert: 'Not authorized.' unless current_user
  end

  helper_method :current_user
end
