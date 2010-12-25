class OauthController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def authorize
    @reauthorize_params = params[:reauthorize_params]
    redirect_to(OAUTH_AUTHORIZE_URL + "?client_id=#{APP_ID}&redirect_uri=#{oauth_callback_url}&scope=publish_stream,offline_access&display=page&type=user_agent") unless @reauthorize_params
  end

  def callback
    if params[:error]
      redirect_to oauth_authorize_path(:reauthorize_params => params)
    else
      redirect_to(OAUTH_TOKEN_URL + "?client_id=#{APP_ID}&redirect_uri=#{oauth_callback_url}&client_secret=#{APP_SECRET}&code=#{params[:code]}&type=user_agent&display=page&display=page&type=user_agent")
    end
  end
end
