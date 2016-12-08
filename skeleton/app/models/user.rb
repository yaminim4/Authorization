class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :session_token, :password_digest, presence: true
  validates :password, length: {allow_nil: true, minimum: 6, message: "Password too short!" }


  after_initialize :ensure_session_token

  attr_reader :password

  def self.reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password)
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(128)
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    bcrypt_obj = BCrypt::Password.new(self.password_digest)
    bcrypt_obj.is_password?(password)
  end

end
