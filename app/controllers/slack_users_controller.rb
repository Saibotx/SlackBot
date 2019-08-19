class SlackUsersController < ApplicationController
  before_action :set_slack_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token


  # GET /slack_users
  # GET /slack_users.json
  def index
    puts "AT INDEX NOW"
    @slack_users = SlackUser.all
    respond_to do |format|
      format.html
      format.json { render :json => @slack_users }
    end
  end

  # GET /slack_users/1
  # GET /slack_users/1.json
  def show
    @slack_user_profile = SlackUserProfile.where(slack_user_id: params['id']).first
    respond_to do |format|
      format.html
      format.json { render :json => @slack_user }
    end
  end

  # POST /slack_users/update
  def sync(next_cursor = "")
    get_params = {
      :token => ENV['SLACK_OAUTH_TOKEN']
    }
    if next_cursor
      get_params[:cursor] = next_cursor
    end

    @users ||= []

    get_response = HTTP.get(
      "#{ENV["SLACK_API_URL"]}/users.list",
      :params => get_params
    )
    body = JSON.parse(get_response.to_s)
    puts "body is #{body}"
    @users = (@users + body["members"]).uniq
    next_cursor = body.dig("response_metadata", "next_cursor")

    #recursively keep building array of users
    unless next_cursor.blank?
      sync(next_cursor)
    else
      #create records
      @users.each do |user|
        create_or_update_user_service = SlackUserService.new(user)
        create_or_update_user_service.perform
      end
      json_response "Synced All users!"
    end
  end

  # POST /slack_users
  # POST /slack_users.json
  def create
    @slack_user = SlackUser.new(slack_user_params)
    respond_to do |format|
      if @slack_user.save
        format.html { redirect_to @slack_user, notice: 'Slack user was successfully created.' }
        format.json { render :show, status: :created, location: @slack_user }
      else
        format.html { render :new }
        format.json { render json: @slack_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slack_users/1
  # PATCH/PUT /slack_users/1.json
  def update
    respond_to do |format|
      if @slack_user.update(slack_user_params)
        format.html { redirect_to @slack_user, notice: 'Slack user was successfully updated.' }
        format.json { render :show, status: :ok, location: @slack_user }
      else
        format.html { render :edit }
        format.json { render json: @slack_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slack_users/1
  # DELETE /slack_users/1.json
  def destroy
    @slack_user.destroy
    respond_to do |format|
      format.html { redirect_to slack_users_url, notice: 'Slack user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slack_user
      @slack_user = SlackUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slack_user_params
      params.require(:slack_user).permit(
        :slack_user_id,
        :team_id,
        :name,
        :real_name,
        :color,
        :tz,
        :tz_label,
        :tz_offset,
        :is_admin,
        :is_owner,
        :is_primary_owner,
        :is_restricted,
        :is_ultra_restricted,
        :is_bot,
        :is_stranger,
        :updated,
        :is_app_user,
        :has_2fa,
        :locale,
        slack_user_profile_attributes: [
          :avatar_hash,
          :real_name,
          :display_name,
          :real_name_normalized,
          :display_name_normalized,
          :email,
          :image_original,
          :status_expiration,
          :status_emoji,
          :team
        ]
      )
    end
end
