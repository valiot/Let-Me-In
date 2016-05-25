Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           scope: [:email, :public_profile], secure_image_url: true,
           image_size: { width: 400, height: 400 }
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'user:email'
  provider :identity, fields: [:name, :email],
                      on_failed_registration: lambda { |env|
                        IdentitiesController.action(:new).call(env)
                      }, on_registration: IdentitiesController.action(:new)
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
