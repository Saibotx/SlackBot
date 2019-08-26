class SlackChannelService
  attr_reader :slack_user, :slack_user_profile, :errors

  def initialize(params, type)
    @channel_params = params
    @type = type
  end

  def perform
    puts "performing #{@channel_params}"
    @slack_user = SlackUser.where(slack_user_id: @channel_params['user']).first
    slack_user_id = @slack_user.id
    puts "@slack_user, #{slack_user_id}";


    if @type == "member_joined_channel"
      @channel = @slack_user.channels.create(slack_channel_id: @channel_params['channel'])
    end

    if @type == "member_left_channel"
      puts "leaving: slack user id #{slack_user_id}"
      @channel = Channel.where(slack_channel_id: @channel_params['channel']).where(slack_user_id: "#{slack_user_id}").first
      @channel.destroy
    end
  end

  def errors
    @errors
  end

  def slack_user
    @slack_user
  end

  def slack_user_profile
    @slack_user_profile
  end
end
