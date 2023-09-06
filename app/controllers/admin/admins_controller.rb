class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @admin = current_admin
  end
end
