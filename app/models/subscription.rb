class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: { with: /\A[\w\d._-]+@[\d\w.]+\.\w+\z/ }, unless: -> { user.present? }
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }

  validate :email_already_exists, unless: -> { user.present? }

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
    errors.add(:user_email, I18n.t('subscriptions.email_already_exists')) if User.exists?(email: user_email)
  end
end
