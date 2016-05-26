class TripPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    false
  end

  def show?
    false  # No show for trips, they are displayed in the dashboard
  end

  def new?
    create?
  end

  def create?
    true  # Anyone can create a trip
  end

  def edit
    update?
  end

  def trip_accept_mission?
    true
  end
  # def search?
  #   true
  # end

  def update?
    #record.user <=> @trip.user AND user <=> current_user dans les politiques
    user_is_owner_or_admin? # Only trip creator can update it and admin
  end

  def destroy?
    user_is_owner_or_admin? # Only trip creator can update it or admin
  end

  private
  def user_is_owner_or_admin?
    user.admin || record.user == user
  end

end
