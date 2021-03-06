class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: { with: /\A[\w\d._-]+@[\d\w.]+\.\w+\z/ }, unless: -> { user.present? }
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :email_already_exists, unless: -> { user.present? }
  validate :self_subscription_ban, if: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def email_already_exists
    errors.add(:user_email, :email_already_exists) if User.exists?(email: user_email.downcase)
  end

  def self_subscription_ban
    errors.add(:event, :self_subscription_ban) if user == event.user
  end
end
