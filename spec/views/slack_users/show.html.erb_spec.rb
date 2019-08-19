require 'rails_helper'

RSpec.describe "slack_users/show", type: :view do
  before(:each) do
    @slack_user = assign(:slack_user, SlackUser.create!(
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
    ))
    @slack_user_profile = assign(:slack_user_profile), SlackUserProfile.create!(
      :slack_user => @slack_user
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Slack User/)
    expect(rendered).to match(/Team/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Real Name/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Tz/)
    expect(rendered).to match(/Tz Label/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Locale/)
  end
end
