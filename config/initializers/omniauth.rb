OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '795754027177788', 'a9be46630514e229c76d66d322029825'
end
