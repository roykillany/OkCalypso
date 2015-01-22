Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["FACEBOOK_API_KEY"], ENV["FACEBOOK_API_SECRET"], secure_image_url: true
end
