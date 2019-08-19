class SlackUserService
  def initialize(slack_params)
    @user_params = slack_params
  end

  def perform
    slack_user = SlackUser.find_or_initialize_by(slack_user_id: @user_params['id'])
    slack_user.attributes = slack_user.map_slack_params_to_attributes(@user_params)
    slack_user.save

    user_profile = @user_params.dig("profile")

    slack_user_profile  = SlackUserProfile
      .find_or_initialize_by(slack_user_id: slack_user.id)
    slack_user_profile.attributes = slack_user_profile
      .map_slack_params_to_attributes(user_profile, slack_user)
    slack_user_profile.save

    #return array of what we just generated
    [slack_user, slack_user_profile]
  end
end
