class UserAuthenticator
  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    user = User.find_by_email(@email)
    return unless user&.authenticate(@password)

    expiration_time = 1.week.from_now
    {
      token: JsonWebToken.encode({ user_id: user.id }, expiration_time),
      expiration_time: expiration_time
    }
  end
end
