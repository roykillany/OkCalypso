class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, :email, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, :email, uniqueness: true
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", tiny: "40x40" }, :default_url => "http://www.genengnews.com/app_themes/genconnect/images/default_profile.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  include PgSearch
  multisearchable against: [:username, :email, :orientation, :zip_code, :country, :gender]

  pg_search_scope :search_by_attr, against: [
    [:username, 'A'],
    [:email, 'B'],
    [:orientation, 'B'],
    [:country, 'B'],
    [:gender, 'B'],
    [:zip_code, 'B'],
  ], using: {
      tsearch: { prefix: true }
      }

  has_one(
    :profile,
    class_name: "Profile",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :preferences,
    class_name: "Preference",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :likes,
    class_name: "Like",
    foreign_key: :liker_id,
    primary_key: :id
  )

  has_many :likees, through: :likes, source: :likee

  has_many(
    :user_answers,
    class_name: "UserAnswer",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many :answered_questions, through: :user_answers, source: :question

  has_many :answers, through: :user_answers, source: :answereds

  has_many(
    :matches,
    class_name: "Match",
    foreign_key: :matcher_id,
    primary_key: :id
  )

  has_many(
    :sent_messages,
    class_name: "Message",
    foreign_key: :sender_id,
    primary_key: :id
  )

  has_many(
    :received_messages,
    class_name: "Message",
    foreign_key: :receiver_id,
    primary_key: :id
  )

  attr_reader :password

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil unless user && user.is_password?(password)
    user
  end

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(
      provider: auth_hash[:provider],
      uid: auth_hash[:uid]
    )

    if user.nil?
      user= User.create!(
        username: "#{auth_hash[:info][:first_name]} #{auth_hash[:info][:last_name]}",
        email: auth_hash[:info][:email],
        password: SecureRandom::urlsafe_base64,
        provider: auth_hash[:provider],
        gender: auth_hash[:extra][:raw_info][:gender],
        uid: auth_hash[:uid],
        orientation: "straight",
        country: "America",
        zip_code: 69,
        avatar: auth_hash[:info][:image]
      )
      user.profile = Profile.new(user_id: @user.id)
      user.preferences = Preference.new(user_id: @user.id)
    end

    user
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
