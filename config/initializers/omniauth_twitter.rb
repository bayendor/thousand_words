Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.config.omniauth_provider_key,
    Rails.application.config.omniauth_provider_secret

  OmniAuth.config.on_failure = Proc.new { |env|
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  }
end
