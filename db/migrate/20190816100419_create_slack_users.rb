class CreateSlackUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :slack_users do |t|
      t.string :slack_user_id
      t.string :team_id
      t.string :name
      t.string :real_name
      t.string :color
      t.string :tz
      t.string :tz_label
      t.integer :tz_offset
      t.boolean :is_admin
      t.boolean :is_owner
      t.boolean :is_primary_owner
      t.boolean :is_restricted
      t.boolean :is_ultra_restricted
      t.boolean :is_bot
      t.boolean :is_stranger
      t.datetime :updated
      t.boolean :is_app_user
      t.boolean :has_2fa
      t.string :locale

      t.timestamps
    end
  end
end
