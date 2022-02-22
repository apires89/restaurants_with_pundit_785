class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    #record --> restaurant instance
    #user --> current_user or user that is logged in
    record.user == user || user.admin
  end

  def destroy?
    record.user == user || user.admin
  end






end
