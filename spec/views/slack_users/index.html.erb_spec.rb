require 'rails_helper'

RSpec.describe "slack_users/index", type: :view do
  before(:each) do
    assign(:slack_users, [
      SlackUser.create!(
        :slack_user_id => "Slack User",
        :team_id => "Team",
        :name => "Name",
        :real_name => "Real Name",
        :color => "Color",
        :tz => "Tz",
        :tz_label => "Tz Label",
        :tz_offset => 2,
        :is_admin => false,
        :is_owner => false,
        :is_primary_owner => false,
        :is_restricted => false,
        :is_ultra_restricted => false,
        :is_bot => false,
        :is_stranger => false,
        :is_app_user => false,
        :has_2fa => false,
        :locale => "Locale"
      ),
      SlackUser.create!(
        :slack_user_id => "Slack User",
        :team_id => "Team",
        :name => "Name",
        :real_name => "Real Name",
        :color => "Color",
        :tz => "Tz",
        :tz_label => "Tz Label",
        :tz_offset => 2,
        :is_admin => false,
        :is_owner => false,
        :is_primary_owner => false,
        :is_restricted => false,
        :is_ultra_restricted => false,
        :is_bot => false,
        :is_stranger => false,
        :is_app_user => false,
        :has_2fa => false,
        :locale => "Locale"
      )
    ])
  end

  it "renders a list of slack_users" do
    render
    assert_select "tr>td", :text => "Slack User".to_s, :count => 2
    assert_select "tr>td", :text => "Team".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Real Name".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Tz".to_s, :count => 2
    assert_select "tr>td", :text => "Tz Label".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 18
    assert_select "tr>td", :text => "Locale".to_s, :count => 2
  end
end
