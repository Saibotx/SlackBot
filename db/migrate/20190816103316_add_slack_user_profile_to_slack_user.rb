class AddSlackUserProfileToSlackUser < ActiveRecord::Migration[5.2]
  def change
    add_reference(:slack_users, :slack_user_profile)
  end
end
