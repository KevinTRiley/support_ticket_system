require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :email => "Email",
        :password => ""
      ),
      stub_model(User,
        :email => "Email",
        :password => ""
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>th", :text => "Email".to_s, :count => 1
  end
end
