module OauthHelper
  def authorization_redirection_js
    "top.location.href = '#{OAUTH_AUTHORIZE_URL}?client_id=#{APP_ID}&redirect_uri=#{oauth_callback_url}&type=user_agent&display=page&scope=publish_stream,offline_access'"
  end
end
