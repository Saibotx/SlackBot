class CreateSlackUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :slack_user_profiles do |t|
      t.string :avatar_hash
      t.string :status_text
      t.string :status_emoji
      t.datetime :status_expiration
      t.string :real_name
      t.string :display_name
      t.string :real_name_normalized
      t.string :display_name_normalized
      t.string :email
      t.string :image_original
      t.string :team
      t.references :slack_user, foreign_key: true

      t.timestamps
    end
  end
end
