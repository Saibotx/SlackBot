class SlackUser < ApplicationRecord
  # model association
  has_one :slack_user_profile, dependent: :destroy

  # validations
  validates_presence_of :slack_user_id, :name, :real_name
end
