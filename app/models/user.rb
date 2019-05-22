class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         # :confirmable, :trackable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter]

  has_many :expenses
  has_many :reports
  has_many :tags

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  def self.from_omniauth(auth, signed_in_resource = nil)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
      user
    else
      # Check user with the same email address
      user_with_email = User.find_by_email(auth.info.email)
      if user_with_email.present?
        user = user_with_email
      else
        user = User.new
        if auth.provider == "facebook"

          user.provider = auth.provider
          user.uid = auth.uid
          user.email = auth.extra.raw_info.email

          user.save

        elsif auth.provider == "twitter"

          user.provider = auth.provider
          user.uid = auth.uid

        elsif auth.provider == "google_oauth2"

          user.provider = auth.provider
          user.uid = auth.uid
          user.email = auth.info.email

          user.save

        end
      end
    end

    user

  end

  # For Twitter (save the session eventhough we redirect user to registration page first)
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  # For Twitter (disable password validation)
  def password_required?
    super && provider.blank?
  end

end
