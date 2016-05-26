class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def profile?
    true
  end

  def show_card?
    true
  end
end
