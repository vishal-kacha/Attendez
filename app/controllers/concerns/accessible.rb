# ../controllers/concerns/accessible.rb
module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_admin
      flash.clear
      redirect_to root_path and return 
    elsif current_student
      flash.clear
      redirect_to root_path and return 
    elsif current_teacher
      redirect_to root_path and return
    end
  end
end
