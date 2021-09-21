class EventPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    update?
  end

  def edit?
    update?
  end

  def index?
    true
  end

  def new?
    user.present?
  end

  def show?
    record.pincode.blank? || user_is_owner? || record.pincode_valid?(cookies["events_#{record.id}_pincode"])
  end

  def update?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
