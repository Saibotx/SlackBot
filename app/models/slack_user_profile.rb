class SlackUserProfile < ApplicationRecord
  # model association
  belongs_to :slack_user
  # validation
  validates_presence_of :real_name, :display_name, :team, :email
end
