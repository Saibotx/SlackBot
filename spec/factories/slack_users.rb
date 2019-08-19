#create fake slack user


FactoryBot.define do
  factory :slack_user_profile do
    avatar_hash "ge3b51ca72de"
    status_text "print is dead"
    status_emoji ":books:"
    status_expiration {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    email Faker::Internet.email
    image_original "https://.../avatar/e3b51ca72dee4ef87916ae2b9240df50.jpg"
  end

  factory :slack_user do

    real_name { Faker::FunnyName.name }
    name { Faker::Name.initials }
    team_id { Faker::Alphanumeric.alphanumeric(number: 10) }

    slack_user_id { Faker::Alphanumeric.alphanumeric(number: 10) }
    color { Faker::Color.hex_color }
    tz "America/New_York"
    tz_label "Eastern Daylight Time"
    tz_offset "-14400"
    is_admin  true
    is_owner  false
    is_primary_owner  false
    is_restricted  false
    is_ultra_restricted  false
    is_bot  false
    is_stranger  false
    updated  {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    is_app_user  false
    has_2fa  false
    locale  "en-US"

    # after(:create) do |slack_user, evaluator|
    #   create(
    #     :slack_user_profile,
    #     slack_user: slack_user,
    #     real_name: evaluator.real_name,
    #     display_name: evaluator.name,
    #     real_name_normalized: evaluator.real_name,
    #     display_name_normalized: evaluator.name,
    #     team: evaluator.team_id
    #   )
    # end

  end
end
