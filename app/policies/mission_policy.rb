class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def search?
    record.user == user
  end
end
