class ActiveAdmin::PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    user.admin
  end

  def index?
    user.admin
  end
end
