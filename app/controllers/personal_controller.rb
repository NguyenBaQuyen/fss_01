class PersonalController < ApplicationController
  layout "personal"

  before_action :authenticate_user!

  private
  def sidebar_count
    @sidebar_personal = Supports::Personal.new current_user
  end
end
