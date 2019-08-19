class AddMissingUserFields < ActiveRecord::Migration[5.2]
  def change
    add_column :slack_users, :deleted, :boolean

    add_column :slack_user_profiles, :title, :string
    add_column :slack_user_profiles, :phone, :string
    add_column :slack_user_profiles, :skype, :string
  end
end
