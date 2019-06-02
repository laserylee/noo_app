class User < ApplicationRecord
  before_save :downcase_email
  validates( :name,
            presence: true,
            uniqueness: true,
            length: { maximum:50, minimum:4} )
  validates( :email,
            presence: true,
            uniqueness: { case_sensitive:false },
            length: { maximum:255 },
            format: { with: /\A[\w\d\-.]+@([a-z\d\-]+\.)+[a-z]+\z/i } )
  has_secure_password
  validates( :password,
            presence: true,
            length: { minimum:6 } )

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

private

  def downcase_email
    self.email = email.downcase
  end
end
