require 'rails_helper'

RSpec.describe SlackUser, type: :model do
  # Association test
  # ensure SlackUser model has a 1:1 relationship with the SlackUserProfile model
  it { should have_one(:slack_user_profile).dependent(:destroy) }
  # Validation tests
  # ensure columns are present before saving
  it { should validate_presence_of(:slack_user_id) }
end
