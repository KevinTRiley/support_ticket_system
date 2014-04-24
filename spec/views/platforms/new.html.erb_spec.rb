require 'spec_helper'

describe "platforms/new" do
  before(:each) do
    assign(:platform, stub_model(Platform,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new platform form" do
    render

    assert_select "form[action=?][method=?]", platforms_path, "post" do
      assert_select "input#platform_name[name=?]", "platform[name]"
    end
  end
end
