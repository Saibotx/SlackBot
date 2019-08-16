json.extract! slack_user, :id, :slack_user_id, :team_id, :name, :real_name, :color, :tz, :tz_label, :tz_offset, :is_admin, :is_owner, :is_primary_owner, :is_restricted, :is_ultra_restricted, :is_bot, :is_stranger, :updated, :is_app_user, :has_2fa, :locale, :created_at, :updated_at
json.url slack_user_url(slack_user, format: :json)
