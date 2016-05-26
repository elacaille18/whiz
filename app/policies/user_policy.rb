class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def profile?
    true
  end

  def show
    true
  end
end
