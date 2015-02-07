require 'rails_helper'

describe ArticlePolicy do
  subject { described_class.new user, record }

  let(:owner) { create :user }
  let(:record) { create :article, user: owner }

  context 'for another user' do
    let(:user) { create :user }

    it { should permits(:show) }
    it { should_not permits(:update) }
    it { should_not permits(:destroy) }
  end

  context 'for owner' do
    let(:user) { owner }

    it { should permits(:show) }
    it { should permits(:update) }
    it { should permits(:destroy) }
  end
end
