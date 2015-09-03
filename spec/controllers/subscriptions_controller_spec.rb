require 'rails_helper'

describe SubscriptionsController do

  let(:user) { create :user }
  let(:group) { create :group }

  before do
    group.admins << user
    sign_in user
  end

  describe 'signup_success' do
    it 'updates the group subscription plan to chargify' do
      get :signup_success, ref: "userId:#{user.id},groupId:#{group.id}"
      group.reload
      expect(group.subscription.kind).to eq 'paid'
      expect(response).to redirect_to group_url(group)
    end
  end

end
