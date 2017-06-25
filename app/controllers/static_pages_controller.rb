class StaticPagesController < ApplicationController
    # skip_before_action :verify_authenticity_token
    GRAPH_RESOURCE = 'https://graph.microsoft.com'
  SENDMAIL_ENDPOINT = '/v1.0/me/microsoft.graph.sendmail'
  CONTENT_TYPE = 'application/json;odata.metadata=minimal;odata.streaming=true'

  def home
  end

  def analytics1
  end


  def analytics2
  end

  def analytics3
  end

  def login
    redirect_to '/auth/microsoft_v2_auth'
  end

  def callback
# Access the authentication hash for omniauth
# and extract the auth token, user name, and email
data = request.env['omniauth.auth']

@email = data[:extra][:raw_info][:userPrincipalName]
@name = data[:extra][:raw_info][:displayName]

# Associate token/user values to the session
session[:access_token] = data['credentials']['token']
session[:name] = @name
session[:email] = @email

# Debug logging
logger.info "Name: #{@name}"
logger.info "Email: #{@email}"
logger.info "[callback] - Access token: #{session[:access_token]}"
end
end
