require 'rails_helper'

RSpec.describe "slack_users/new", type: :view do
  before(:each) do
    assign(:slack_user, SlackUser.new(
      :slack_user_id => "MyString",
      :team_id => "MyString",
      :name => "MyString",
      :real_name => "MyString",
      :color => "MyString",
      :tz => "MyString",
      :tz_label => "MyString",
      :tz_offset => 1,
      :is_admin => false,
      :is_owner => false,
      :is_primary_owner => false,
      :is_restricted => false,
      :is_ultra_restricted => false,
      :is_bot => false,
      :is_stranger => false,
      :is_app_user => false,
      :has_2fa => false,
      :locale => "MyString"
    ))
  end

  it "renders new slack_user form" do
    render

    assert_select "form[action=?][method=?]", slack_users_path, "post" do

      assert_select "input[name=?]", "slack_user[slack_user_id]"

      assert_select "input[name=?]", "slack_user[team_id]"

      assert_select "input[name=?]", "slack_user[name]"

      assert_select "input[name=?]", "slack_user[real_name]"

      assert_select "input[name=?]", "slack_user[color]"

      assert_select "input[name=?]", "slack_user[tz]"

      assert_select "input[name=?]", "slack_user[tz_label]"

      assert_select "input[name=?]", "slack_user[tz_offset]"

      assert_select "input[name=?]", "slack_user[is_admin]"

      assert_select "input[name=?]", "slack_user[is_owner]"

      assert_select "input[name=?]", "slack_user[is_primary_owner]"

      assert_select "input[name=?]", "slack_user[is_restricted]"

      assert_select "input[name=?]", "slack_user[is_ultra_restricted]"

      assert_select "input[name=?]", "slack_user[is_bot]"

      assert_select "input[name=?]", "slack_user[is_stranger]"

      assert_select "input[name=?]", "slack_user[is_app_user]"

      assert_select "input[name=?]", "slack_user[has_2fa]"

      assert_select "input[name=?]", "slack_user[locale]"
    end
  end
end
