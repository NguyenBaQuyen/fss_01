class Admin::UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def edit?
    user != record
  end

  def update?
    user.admin?
  end

  def home?
    user.admin?
  end
end
