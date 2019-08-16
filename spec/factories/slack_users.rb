#create fake slack user

FactoryBot.define do
  factory :slack_user do
    name = Faker::Name.name
    display_name = Faker::Name.initials
    team = Faker::Alphanumeric.alphanumeric(number: 10)

    id { Faker::Alphanumeric.alphanumeric(number: 10) }
    team_id  team
    name { first_name }
    color { Faker::Color.hex_color }
    real_name { Faker::FunnyName.name }
    tz "America/New_York"
    tz_label "Eastern Daylight Time"
    tz_offset "-14400"
    profile {{
      "avatar_hash" => "ge3b51ca72de",
      "status_text" => "Print is dead",
      "status_emoji" => " =>books:",
      "status_expiration" => Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
      "real_name" => name,
      "display_name" => display_name,
      "real_name_normalized" => name.Faker::Name.gsub(/[^0-9a-z ]/i),
      "display_name_normalized" => display_name,
      "email" => Faker::Internet.email,
      "image_original" => "https://.../avatar/e3b51ca72dee4ef87916ae2b9240df50.jpg",
      "image_24" => "https://.../avatar/e3b51ca72dee4ef87916ae2b9240df50.jpg",
      "image_32" => "https://.../avatar/e3b51ca72dee4ef87916ae2b9240df50.jpg",
      "image_48" => "https://.../avatar/e3b51ca72dee4ef87916ae2b9240df50.jpg",
      "image_72" => "https://.../avatar/e3b51ca72dee4ef87916ae2b9240df50.jpg",
      "image_192" => "https://.../avatar/e3b51ca72dee4ef87916ae2b9240df50.jpg",
      "image_512" => "https://.../avatar/e3b51ca72dee4ef87916ae2b9240df50.jpg",
      "team" => team
    }}
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
end
