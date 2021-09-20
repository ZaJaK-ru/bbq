require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:owner) { create(:user) }
  let(:event) { create(:event, user: owner) }

  subject { described_class }

  context 'when user owner' do
    permissions :create? do
      it { is_expected.to permit(owner, Event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(owner, event) }
    end

    permissions :show? do
      it { is_expected.to permit(owner, event) }
    end
  end

  context 'when user not owner' do
    let(:user) { create(:user) }

    permissions :create? do
      it { is_expected.to permit(user, Event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, event) }
    end

    permissions :show? do
      it { is_expected.to permit(user, event) }
    end
  end

  context 'when anonymous' do
    permissions :create? do
      it { is_expected.not_to permit(nil, Event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end

    permissions :show? do
      it { is_expected.to permit(nil, event) }
    end
  end
end
