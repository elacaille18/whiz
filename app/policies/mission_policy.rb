class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end

  def create?
    true
  end

  def search?
    record.user == user
  end

  def check_start_code?
    true
  end

  def check_end_code?
    true
  end
end
