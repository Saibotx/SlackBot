require 'rails_helper'

RSpec.describe SlackUserProfile, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:slack_user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:team) }
end
