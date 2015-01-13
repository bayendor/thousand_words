Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.config.omniauth_provider_key,
    Rails.application.config.omniauth_provider_secret
end
