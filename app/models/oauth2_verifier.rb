# frozen_string_literal: true

class Oauth2Verifier < OauthToken
  validates_presence_of :user
  attr_accessor :state

  def exchange!(_params = {})
    OauthToken.transaction do
      token = Oauth2Token.create!(user:, client_application:, scope:)
      invalidate!
      token
    end
  end

  def code
    token
  end

  def redirect_url
    callback_url
  end

  def to_query
    q = "code=#{token}"
    q << "&state=#{CGI.escape(state)}" if @state
    q
  end

  protected

  def generate_keys
    self.token = OAuth::Helper.generate_key(20)[0, 20]
    self.expires_at = 10.minutes.from_now
    self.authorized_at = Time.now
  end
end
