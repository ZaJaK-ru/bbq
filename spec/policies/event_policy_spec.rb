require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  subject { described_class }

  let(:owner) { create(:user) }
  let(:event) { create(:event, user: owner) }
  let(:event_with_pincode) { create(:event, user: owner, pincode: '1111') }
  let(:cookies) { { "events_#{event_with_pincode.id}_pincode" => '1111' } }

  context 'when user owner' do
    let(:event_owner) { OpenStruct.new(user: owner, cookies: {}) }

    permissions :create? do
      it { is_expected.to permit(event_owner) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(event_owner, event) }
    end

    permissions :show? do
      it { is_expected.to permit(event_owner, event) }
      it { is_expected.to permit(event_owner, event_with_pincode) }
    end
  end

  context 'when user not owner' do
    let(:user) { OpenStruct.new(user: create(:user), cookies: {}) }
    let(:user_with_cookies) { OpenStruct.new(user: user, cookies: cookies) }

   permissions :create? do
     it { is_expected.to permit(user) }
   end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, event) }
    end

    permissions :show? do
      it { is_expected.to permit(user, event) }
      it { is_expected.not_to permit(user, event_with_pincode) }
      it { is_expected.to permit(user_with_cookies, event_with_pincode) }
    end
  end

  context 'when anonymous' do
    let(:anonymous) { OpenStruct.new(user: nil, cookies: {}) }
    let(:anonymous_with_cookies) { OpenStruct.new(user: nil, cookies: cookies) }

    permissions :create? do
      it { is_expected.not_to permit(anonymous) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(anonymous, event) }
    end

    permissions :show? do
      it { is_expected.to permit(anonymous, event) }
      it { is_expected.to permit(anonymous_with_cookies, event_with_pincode) }
    end
  end
end
