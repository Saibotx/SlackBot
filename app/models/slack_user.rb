class SlackUser < ApplicationRecord
  # model association
  has_one :slack_user_profile, dependent: :destroy

  # self.primary_key = 'slack_user_id'

  accepts_nested_attributes_for :slack_user_profile

  # validations
  validates_presence_of :slack_user_id, :name, :real_name
  validates_uniqueness_of :slack_user_id


  def map_slack_params_to_attributes(slack_params)
    {
      slack_user_id: slack_params['id'],
      team_id: slack_params['team_id'],
      name: slack_params['name'],
      real_name: slack_params['real_name'],
      tz: slack_params["tz"],
      tz_label: slack_params["tz_label"],
      tz_offset: slack_params["tz_offset"],
      color: slack_params["color"],
      is_admin: slack_params["is_admin"],
      is_owner: slack_params["is_owner"],
      is_restricted: slack_params["is_restricted"],
      is_ultra_restricted: slack_params["is_ultra_restricted"],
      is_bot: slack_params["is_bot"],
      is_stranger: slack_params["is_stranger"],
      updated: slack_params["updated"],
      is_app_user: slack_params["is_app_user"],
      has_2fa: slack_params["has_2fa"],
      locale: slack_params["locale"]
    }
  end
end
