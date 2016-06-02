class MissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index
    false
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

  def payment?
    record.user ==user
  end

  def check_start_code?
    true
  end

  def check_end_code?
    true
  end
end
