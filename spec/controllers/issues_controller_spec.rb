require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe IssuesController do

  # This should return the minimal set of attributes required to create a valid
  # Issue. As you add validations to Issue, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "description" => "validDescription", "state" => "validState", "urgency" => 0, "email" => "from@example.com" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IssuesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  context "With authorization" do
    let!(:user) { FactoryGirl.build_stubbed(:user) }

    let(:valid_session) { {"user_id" => user.id} }

    before do
      allow(User).to receive(:find_by).with(id: user.id) { user }
    end

    describe "GET index" do
      it "assign all issues as @issues" do
        issue = Issue.create! valid_attributes
        get :index, {}, valid_session

        expect(assigns(:issues)).to eq([issue])
      end
    end

    describe "GET show" do
      it "assign the requested issue as @issue" do
        issue = Issue.create! valid_attributes
        get :show, {:id => issue.to_param}, valid_session
        expect(assigns(:issue)).to eq(issue)
      end
    end

    describe "GET new" do
      it "assigns a new issue as @issue" do
        get :new, {}, valid_session
        expect(assigns(:issue)).to be_a_new(Issue)
      end
    end

    describe "GET edit" do
      it "assigns the requested issue as @issue" do
        issue = Issue.create! valid_attributes
        get :edit, {:id => issue.id}, valid_session
        expect(assigns(:issue)).to eq(issue)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "create a new Issue" do
          expect {
            post :create, {:issue => valid_attributes}, valid_session
          }.to change(Issue, :count).by(1)
        end

        it "assign a newly created issue as @issue" do
          post :create, {:issue => valid_attributes}, valid_session
          expect(assigns(:issue)).to be_a(Issue)
          expect(assigns(:issue)).to be_persisted
        end

        it "redirect to the created issue" do
          post :create, {:issue => valid_attributes}, valid_session
          expect(response).to redirect_to(Issue.last)
        end
      end

      describe "with invalid params" do
        it "assign a newly created but unsaved issue as @issue" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Issue).to receive(:save).and_return(false)
          post :create, {:issue => { "description" => "invalid value" }}, valid_session
          expect(assigns(:issue)).to be_a_new(Issue)
        end

        it "re-render the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Issue).to receive(:save).and_return(false)
          post :create, {:issue => { "description" => "invalid value" }}, valid_session
          expect(response).to render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "update the requested issue" do
          issue = Issue.create! valid_attributes
          # Assuming there are no other issues in the database, this
          # specifies that the Issue created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          expect_any_instance_of(Issue).not_to receive(:update).with({ "description" => "MyText" })
          put :update, {:id => issue.id, :issue => valid_attributes}, valid_session
        end

        it "assign the requested issue as @issue" do
          issue = Issue.create! valid_attributes
          put :update, {:id => issue.to_param, :issue => valid_attributes}, valid_session
          expect(assigns(:issue)).to eq(issue)
          expect(response).to redirect_to(issue_url)
        end

        it "redirect to the issue" do
          issue = Issue.create! valid_attributes
          put :update, {:id => issue.to_param, :issue => valid_attributes}, valid_session
          expect(response).to redirect_to(issue_url)
        end
      end

      describe "with invalid params" do
        it "assign the issue as @issue" do
          issue = Issue.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Issue).to receive(:save).and_return(false)
          put :update, {:id => issue.to_param, :issue => { "description" => "invalid value" }}, valid_session
          expect(assigns(:issue)).to eq(issue)
        end

        it "re-render the 'edit' template" do
          issue = Issue.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Issue).to receive(:save).and_return(false)
          put :update, {:id => issue.to_param, :issue => { "description" => "invalid value" }}, valid_session
          expect(response).to render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested issue" do
        issue = Issue.create! valid_attributes
        expect {
          delete :destroy, {:id => issue.to_param}, valid_session
        }.to change(Issue, :count).by(-1)
      end

      it "redirect to the issues list" do
        issue = Issue.create! valid_attributes
        delete :destroy, {:id => issue.to_param}, valid_session
        expect(response).to redirect_to(issues_url)
      end
    end
  end

  context "Without authorization" do
    describe "GET index" do
      it "cannot assign all issues as @issues" do
        issue = Issue.create! valid_attributes
        get :index, {}, valid_session

        expect(assigns(:issues)).to eq(nil)
      end
    end

    describe "GET show" do
      it "cannot assign the requested issue as @issue" do
        issue = Issue.create! valid_attributes
        get :show, {:id => issue.to_param}, valid_session
        expect(assigns(:issue)).to eq(nil)
      end
    end

    describe "cannot GET new" do
      it "assigns a new issue as @issue" do
        get :new, {}, valid_session
        expect(assigns(:issue)).not_to be_a_new(Issue)
      end
    end

    describe "cannot GET edit" do
      it "assigns the requested issue as @issue" do
        issue = Issue.create! valid_attributes
        get :edit, {:id => issue.id}, valid_session
        expect(assigns(:issue)).to eq(nil)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "cannot create a new Issue" do
          expect {
            post :create, {:issue => valid_attributes}, valid_session
          }.to change(Issue, :count).by(0)
        end

        it "cannot assign a newly created issue as @issue" do
          post :create, {:issue => valid_attributes}, valid_session
          expect(assigns(:issue)).not_to be_a(Issue)
          #expect(assigns(:issue)).to be_persisted
        end

        it "cannot redirect to the created issue" do
          post :create, {:issue => valid_attributes}, valid_session
          #expect(response).to redirect_to(Issue.last)
          expect(response).to redirect_to(login_url)
        end
      end

      describe "with invalid params" do
        it "cannot assign a newly created but unsaved issue as @issue" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Issue).to receive(:save).and_return(false)
          post :create, {:issue => { "description" => "invalid value" }}, valid_session
          expect(assigns(:issue)).not_to be_a_new(Issue)
        end

        it "cannot re-render the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Issue).to receive(:save).and_return(false)
          post :create, {:issue => { "description" => "invalid value" }}, valid_session
          #expect(response).to render_template("new")
          expect(response).to redirect_to(login_url)
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "cannot update the requested issue" do
          issue = Issue.create! valid_attributes
          # Assuming there are no other issues in the database, this
          # specifies that the Issue created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          expect_any_instance_of(Issue).not_to receive(:update).with({ "description" => "MyText" })
          put :update, {:id => issue.id, :issue => { "description" => "MyText" }}, valid_session
          expect(response).to redirect_to(login_url)
        end

        it "cannot assign the requested issue as @issue" do
          issue = Issue.create! valid_attributes
          put :update, {:id => issue.to_param, :issue => valid_attributes}, valid_session
          expect(assigns(:issue)).not_to eq(issue)
          expect(response).to redirect_to(login_url)
        end

        it "cannot redirect to the issue" do
          issue = Issue.create! valid_attributes
          put :update, {:id => issue.to_param, :issue => valid_attributes}, valid_session
          expect(response).to redirect_to(login_url)
        end
      end

      describe "with invalid params" do
        it "cannot assign the issue as @issue" do
          issue = Issue.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Issue).to receive(:save).and_return(false)
          put :update, {:id => issue.to_param, :issue => { "description" => "invalid value" }}, valid_session
          expect(assigns(:issue)).not_to eq(issue)
        end

        it "cannot re-render the 'edit' template" do
          issue = Issue.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          allow_any_instance_of(Issue).to receive(:save).and_return(false)
          put :update, {:id => issue.to_param, :issue => { "description" => "invalid value" }}, valid_session
          expect(response).to redirect_to(login_url)
        end
      end
    end

    describe "DELETE destroy" do
      it "cannot destroy the requested issue" do
        issue = Issue.create! valid_attributes
        expect {
          delete :destroy, {:id => issue.to_param}, valid_session
        }.to change(Issue, :count).by(0)
      end

      it "cannot redirect to the issues list" do
        issue = Issue.create! valid_attributes
        delete :destroy, {:id => issue.to_param}, valid_session
        expect(response).to redirect_to(login_url)
      end
    end
  end
end
