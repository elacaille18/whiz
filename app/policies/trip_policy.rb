class TripPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
          if user.admin?
            scope.all
          else
            scope.where(created: true)
          end
        end
      end

  end

    def show?
      true  # Anyone can view a tripe
    end

    def create?
      true  # Anyone can create a trip
    end

    def update?
      record.user == user  # Only trip creator can update it
    end

    def destroy?
      record.user == user  # Only trip creator can update it
    end
end
