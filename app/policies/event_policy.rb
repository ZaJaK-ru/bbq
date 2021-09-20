class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.present?
  end

  def destroy?
    update?
  end

  def edit?
    update?
  end

  def show?
    true
  end

  def update?
    user_is_owner?(record)
  end

  private

  def user_is_owner?(event)
    user.present? && event.user == user
  end
end
