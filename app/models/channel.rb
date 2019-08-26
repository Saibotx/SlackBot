class Channel < ApplicationRecord
  belongs_to :slack_user

  validates_presence_of :slack_user

  
end
