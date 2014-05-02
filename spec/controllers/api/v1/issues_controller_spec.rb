require 'spec_helper'

module Api
  module V1
    describe IssuesController do
      let!(:user) { FactoryGirl.build_stubbed(:user) }

      let(:valid_session) { {"user_id" => user.id} }

      before do
        allow(User).to receive(:find_by).with(id: user.id) { user }
      end

      describe "POST issue api" do
        it "assign the requested issue as @issue" do
          json = { format: "json", issue: { description: "description string", state: "New", urgency: 0, picture: "picture.jpg", attachment: "attachment.txt", email: "test@domain.ca", device_id: 1, platform_id: 1, category_id: 1 } }
          post :create, json, valid_session
          expect(response.status).to eq(200)
        end
      end

    end
  end
end