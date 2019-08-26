class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      t.string :slack_channel_id
      t.string :name
      t.references :slack_user, foreign_key: true
      t.timestamps
    end
  end
end
