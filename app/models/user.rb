class User < ActiveRecord::Base
  def self.find_or_create_from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create
    user.update(
      name: auth.info.name,
      oauth_token: auth.credentials.token,
      oauth_secret: auth.credentials.secret
      # profile_image: auth.info.image
    )
    user
  end
end
