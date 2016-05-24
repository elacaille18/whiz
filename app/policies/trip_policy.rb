class TripPolicy < ApplicationPolicy

  class Scope < Scope


    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

  end

    def show?
      true  # Anyone can view a tripe
    end

    def new
      create?
    end

    def create?
      true  # Anyone can create a trip
    end

    def update?
      record.user == user  # Only trip creator can update it
    end

    def destroy?
      record.user == user   # Only trip creator can update it
    end
end
